import 'dart:async';
import '../../domain/commands/result.dart';
import '../../domain/models/models.dart';
import 'device_repository.dart';
import 'modbus_addresses.dart';

class MockDeviceRepository implements DeviceRepository {
  final _statusController = StreamController<DeviceStatus>.broadcast();
  DeviceStatus _currentStatus = const DeviceStatus();
  Timer? _timer;
  ThermocycleSettings? _currentSettings;
  ConstantModeSettings? _constantSettings;
  final _modbusReader = ModbusReader();

  MockDeviceRepository() {
    _statusController.add(_currentStatus);
  }

  @override
  Stream<DeviceStatus> get statusStream => _statusController.stream;

  @override
  DeviceStatus get currentStatus => _currentStatus;

  @override
  Future<Result<void>> startThermocycle(ThermocycleSettings settings) async {
    _currentSettings = settings;
    _currentStatus = _currentStatus.copyWith(
      state: DeviceState.running,
      mode: OperationMode.thermocycle,
      currentCycle: 0,
      progress: 0.0,
      remainingTime: settings.estimatedDuration,
    );
    _statusController.add(_currentStatus);

    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        _startSimulation();
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<void>> startConstantMode(ConstantModeSettings settings) async {
    _constantSettings = settings;
    _currentStatus = _currentStatus.copyWith(
      state: DeviceState.running,
      mode: OperationMode.constant,
      progress: 0.0,
      remainingTime: settings.isInfinite
          ? Duration.zero
          : settings.duration,
    );
    _statusController.add(_currentStatus);

    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        _startSimulation();
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<void>> pause() async {
    _currentStatus = _currentStatus.copyWith(state: DeviceState.paused);
    _statusController.add(_currentStatus);
    _timer?.cancel();

    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<void>> resume() async {
    _currentStatus = _currentStatus.copyWith(state: DeviceState.running);
    _statusController.add(_currentStatus);

    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        _startSimulation();
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<void>> stop() async {
    _currentStatus = _currentStatus.copyWith(
      state: DeviceState.ready,
      mode: OperationMode.idle,
      progress: 0.0,
    );
    _statusController.add(_currentStatus);
    _timer?.cancel();

    final result = await _simulatedAction();
    switch (result) {
      case Ok():
        return result;
      case Error():
        return result;
    }
  }

  @override
  Future<Result<void>> emergencyStop() async {
    _currentStatus = _currentStatus.copyWith(
      state: DeviceState.error,
      mode: OperationMode.idle,
    );
    _statusController.add(_currentStatus);
    _timer?.cancel();

    final result = await _simulatedAction();
    switch (result) {
      case Ok():
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

      if (_currentStatus.mode == OperationMode.constant) {
        double targetTemp = _constantSettings?.targetTemp ?? 37.0;
        double nextChamber = _currentStatus.currentChamberTemp +
            (targetTemp - _currentStatus.currentChamberTemp) * 0.1 +
            (DateTime.now().second % 10 - 5) * 0.05; // noise

        double nextProgress = _currentStatus.progress;
        Duration nextRemaining = _currentStatus.remainingTime;
        if (_constantSettings != null && !_constantSettings!.isInfinite) {
          final totalSecs = _constantSettings!.duration.inSeconds;
          if (totalSecs > 0) {
            nextRemaining = _currentStatus.remainingTime > Duration.zero
                ? _currentStatus.remainingTime - const Duration(seconds: 1)
                : Duration.zero;
            final elapsed = totalSecs - nextRemaining.inSeconds;
            nextProgress = (elapsed / totalSecs).clamp(0.0, 1.0);

            if (nextRemaining == Duration.zero) {
              stop();
              return;
            }
          }
        }

        final chamber1 = _modbusReader.readFloat32FromMockDevice(ModbusAddresses.chamber1Temp, baseValue: nextChamber);
        final chamber2 = _modbusReader.readFloat32FromMockDevice(ModbusAddresses.chamber2Temp, baseValue: nextChamber);
        final chamber3 = _modbusReader.readFloat32FromMockDevice(ModbusAddresses.chamber3Temp, baseValue: nextChamber);
        final chamber4 = _modbusReader.readFloat32FromMockDevice(ModbusAddresses.chamber4Temp, baseValue: nextChamber);
        final watchdog = _modbusReader.readBooleanFromMockDevice(ModbusAddresses.watchdogStatus);
        final level = _modbusReader.readFloat32FromMockDevice(ModbusAddresses.levelSensor);
        final hits = _modbusReader.readUint16FromMockDevice(ModbusAddresses.hitCount, currentValue: _currentStatus.hitCount);

        _currentStatus = _currentStatus.copyWith(
          currentChamberTemp: nextChamber,
          temp1Sensor: _currentStatus.temp1Sensor.copyWith(
            value: DoubleValue(chamber1),
            status: _sensorStatusForValue(SensorType.temperature, chamber1),
          ),
          currentChamber2Temp: chamber2,
          currentChamber3Temp: chamber3,
          currentChamber4Temp: chamber4,
          watchdogStatus: watchdog,
          levelSensor: level,
          hitCount: hits,
          progress: nextProgress,
          remainingTime: nextRemaining,
        );
        _statusController.add(_currentStatus);
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

      final chamber1 = _modbusReader.readFloat32FromMockDevice(ModbusAddresses.chamber1Temp, baseValue: nextChamber);
      final chamber2 = _modbusReader.readFloat32FromMockDevice(ModbusAddresses.chamber2Temp, baseValue: nextChamber);
      final chamber3 = _modbusReader.readFloat32FromMockDevice(ModbusAddresses.chamber3Temp, baseValue: nextChamber);
      final chamber4 = _modbusReader.readFloat32FromMockDevice(ModbusAddresses.chamber4Temp, baseValue: nextChamber);
      final watchdog = _modbusReader.readBooleanFromMockDevice(ModbusAddresses.watchdogStatus);
      final level = _modbusReader.readFloat32FromMockDevice(ModbusAddresses.levelSensor);
      final hits = _modbusReader.readUint16FromMockDevice(ModbusAddresses.hitCount, currentValue: _currentStatus.hitCount);

       _currentStatus = _currentStatus.copyWith(
         currentColdBathTemp: nextCold,
         currentHotBathTemp: nextHot,
         currentChamberTemp: nextChamber,
         temp1Sensor: _currentStatus.temp1Sensor.copyWith(
           value: DoubleValue(chamber1),
           status: _sensorStatusForValue(SensorType.temperature, chamber1),
         ),
         currentChamber2Temp: chamber2,
        currentChamber3Temp: chamber3,
        currentChamber4Temp: chamber4,
        watchdogStatus: watchdog,
        levelSensor: level,
        hitCount: hits,
        currentCycle: nextCycle,
        progress: nextProgress.clamp(0.0, 1.0),
        remainingTime: _currentStatus.remainingTime > Duration.zero
            ? _currentStatus.remainingTime - const Duration(seconds: 1)
            : Duration.zero,
      );
      _statusController.add(_currentStatus);
    });
  }

  //TODO: replace arbitrary values by values preset in a file
  SensorStatus _sensorStatusForValue(SensorType type, double value) {
    // Centralized sensor status logic per sensor type. Thresholds are conservative
    // and can be adjusted to match real hardware behavior.
    if (value.isNaN) return SensorStatus.faulty;

    switch (type) {
      case SensorType.temperature:
        if (value < 0.0 || value > 100.0) return SensorStatus.faulty;
        if (value > 30.0) return SensorStatus.overlimit;
        return SensorStatus.normal;

      case SensorType.level:
        // Level sensor: negative = faulty. Very low or extremely high readings are "overlimit".
        if (value < 0.0) return SensorStatus.faulty;
        if (value < 5.0 || value > 300.0) return SensorStatus.overlimit;
        return SensorStatus.normal;

      case SensorType.flow:
        // Flow sensor: negative is faulty, very high flow is overlimit
        if (value < 0.0) return SensorStatus.faulty;
        if (value > 10.0) return SensorStatus.overlimit;
        return SensorStatus.normal;

      case SensorType.pressure:
        if (value < 0.0 || value > 200.0) return SensorStatus.faulty;
        if (value > 120.0) return SensorStatus.overlimit;
        return SensorStatus.normal;

      case SensorType.digital:
      default:
        // For digital/text sensors represented numerically, consider out-of-range as faulty.
        if (value < 0.0) return SensorStatus.faulty;
        return SensorStatus.normal;
    }
  }

  @override
  Future<Result<void>> setPump1Pulse(int pulse) async {
    _currentStatus = _currentStatus.copyWith(p1Pulse: pulse.clamp(0, 1000));
    _statusController.add(_currentStatus);
    return await _simulatedAction();
  }

  @override
  Future<Result<void>> setPump2Pulse(int pulse) async {
    _currentStatus = _currentStatus.copyWith(p2Pulse: pulse.clamp(0, 1000));
    _statusController.add(_currentStatus);
    return await _simulatedAction();
  }

  @override
  Future<Result<void>> setHotFillValve(bool open) async {
    _currentStatus = _currentStatus.copyWith(hotFillValve: open);
    _statusController.add(_currentStatus);
    return await _simulatedAction();
  }

  @override
  Future<Result<void>> setHotDrainValve(bool open) async {
    _currentStatus = _currentStatus.copyWith(hotDrainValve: open);
    _statusController.add(_currentStatus);
    return await _simulatedAction();
  }

  @override
  Future<Result<void>> setColdFillValve(bool open) async {
    _currentStatus = _currentStatus.copyWith(coldFillValve: open);
    _statusController.add(_currentStatus);
    return await _simulatedAction();
  }

  @override
  Future<Result<void>> setColdDrainValve(bool open) async {
    _currentStatus = _currentStatus.copyWith(coldDrainValve: open);
    _statusController.add(_currentStatus);
    return await _simulatedAction();
  }

  @override
  Future<Result<void>> resetHitCount() async {
    _currentStatus = _currentStatus.copyWith(hitCount: 0);
    _statusController.add(_currentStatus);
    return await _simulatedAction();
  }
}
