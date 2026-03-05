import 'dart:async';
import '../../domain/models/models.dart';
import 'device_repository.dart';

class MockDeviceRepository implements DeviceRepository {
  final _statusController = StreamController<DeviceStatus>.broadcast();
  DeviceStatus _currentStatus = const DeviceStatus();
  Timer? _timer;
  ThermocycleSettings? _currentSettings;

  MockDeviceRepository() {
    _statusController.add(_currentStatus);
  }

  @override
  Stream<DeviceStatus> get statusStream => _statusController.stream;

  @override
  DeviceStatus get currentStatus => _currentStatus;

  @override
  Future<void> startThermocycle(ThermocycleSettings settings) async {
    _currentSettings = settings;
    _currentStatus = _currentStatus.copyWith(
      state: DeviceState.running,
      mode: OperationMode.thermocycle,
      currentCycle: 0,
      progress: 0.0,
      remainingTime: settings.estimatedDuration,
    );
    _statusController.add(_currentStatus);
    _startSimulation();
  }

  @override
  Future<void> startConstantMode(ConstantModeSettings settings) async {
    _currentStatus = _currentStatus.copyWith(
      state: DeviceState.running,
      mode: OperationMode.constant,
      progress: 0.0,
      remainingTime: settings.isInfinite ? Duration.zero : settings.duration,
    );
    _statusController.add(_currentStatus);
    _startSimulation();
  }

  @override
  Future<void> pause() async {
    _currentStatus = _currentStatus.copyWith(state: DeviceState.paused);
    _statusController.add(_currentStatus);
    _timer?.cancel();
  }

  @override
  Future<void> resume() async {
    _currentStatus = _currentStatus.copyWith(state: DeviceState.running);
    _statusController.add(_currentStatus);
    _startSimulation();
  }

  @override
  Future<void> stop() async {
    _currentStatus = _currentStatus.copyWith(
      state: DeviceState.ready,
      mode: OperationMode.idle,
      progress: 0.0,
    );
    _statusController.add(_currentStatus);
    _timer?.cancel();
  }

  @override
  Future<void> emergencyStop() async {
    _currentStatus = _currentStatus.copyWith(
      state: DeviceState.error,
      mode: OperationMode.idle,
    );
    _statusController.add(_currentStatus);
    _timer?.cancel();
  }

  @override
  Future<void> saveSettings(ThermocycleSettings settings) async {
    // In a real app, this would save to SharedPreferences or a database
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<ThermocycleSettings> loadSettings() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const ThermocycleSettings();
  }

  void _startSimulation() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentStatus.state != DeviceState.running) {
        timer.cancel();
        return;
      }

      // Simulate temperature changes and progress
      double nextCold =
          _currentStatus.currentColdBathTemp +
          (5.0 - _currentStatus.currentColdBathTemp) * 0.1;
      double nextHot =
          _currentStatus.currentHotBathTemp +
          (55.0 - _currentStatus.currentHotBathTemp) * 0.1;

      int nextCycle = _currentStatus.currentCycle;
      double nextProgress = _currentStatus.progress + 0.01;
      if (nextProgress >= 1.0) {
        nextProgress = 0.0;
        nextCycle++;
      }

      if (_currentSettings != null &&
          nextCycle >= _currentSettings!.targetCycles) {
        stop();
        return;
      }

      double nextChamber =
          (nextCold + nextHot) / 2 +
          (DateTime.now().second % 10 - 5) * 0.5; // Add some noise

      _currentStatus = _currentStatus.copyWith(
        currentColdBathTemp: nextCold,
        currentHotBathTemp: nextHot,
        currentChamberTemp: nextChamber,
        currentCycle: nextCycle,
        progress: nextProgress.clamp(0.0, 1.0),
        remainingTime: _currentStatus.remainingTime > Duration.zero
            ? _currentStatus.remainingTime - const Duration(seconds: 1)
            : Duration.zero,
      );
      _statusController.add(_currentStatus);
    });
  }
}
