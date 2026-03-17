import 'dart:async';
import '../../domain/commands/result.dart';
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
  Future<Result<void>> startThermocycle(ThermocycleSettings settings) async {
    final result = await _simulatedAction();
    switch (result) {
      case Ok():
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
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<void>> startConstantMode(ConstantModeSettings settings) async {
    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        _currentStatus = _currentStatus.copyWith(
          state: DeviceState.running,
          mode: OperationMode.constant,
          progress: 0.0,
          remainingTime: settings.isInfinite
              ? Duration.zero
              : settings.duration,
        );
        _statusController.add(_currentStatus);
        _startSimulation();
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<void>> pause() async {
    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        _currentStatus = _currentStatus.copyWith(state: DeviceState.paused);
        _statusController.add(_currentStatus);
        _timer?.cancel();
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<void>> resume() async {
    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        _currentStatus = _currentStatus.copyWith(state: DeviceState.running);
        _statusController.add(_currentStatus);
        _startSimulation();
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<void>> stop() async {
    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        _currentStatus = _currentStatus.copyWith(
          state: DeviceState.ready,
          mode: OperationMode.idle,
          progress: 0.0,
        );
        _statusController.add(_currentStatus);
        _timer?.cancel();
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<void>> emergencyStop() async {
    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        _currentStatus = _currentStatus.copyWith(
          state: DeviceState.error,
          mode: OperationMode.idle,
        );
        _statusController.add(_currentStatus);
        _timer?.cancel();
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<void>> saveSettings(ThermocycleSettings settings) async {
    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<ThermocycleSettings>> loadSettings() async {
    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        return const Result.ok(ThermocycleSettings());
      case Error(error: final e):
        return Result.error(e);
    }
  }

  Future<Result<void>> _simulatedAction() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return const Result.ok(null);
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
