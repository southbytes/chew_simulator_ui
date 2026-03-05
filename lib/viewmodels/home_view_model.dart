import 'package:flutter/foundation.dart';
import '../domain/models/models.dart';
import '../data/repositories/device_repository.dart';
import '../domain/commands/commands.dart';

class HomeViewModel extends ChangeNotifier {
  final DeviceRepository _repository;
  DeviceStatus _status = const DeviceStatus();

  HomeViewModel(this._repository) {
    _status = _repository.currentStatus;
    _repository.statusStream.listen((status) {
      _status = status;
      notifyListeners();
    });
  }

  DeviceStatus get status => _status;

  void start() {
    StartThermocycleCommand(_repository, const ThermocycleSettings()).execute();
  }

  void pauseResume() {
    if (_status.state == DeviceState.running) {
      PauseCommand(_repository).execute();
    } else if (_status.state == DeviceState.paused) {
      ResumeCommand(_repository).execute();
    }
  }

  void stop() {
    StopCommand(_repository).execute();
  }
}
