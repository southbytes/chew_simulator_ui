import 'package:flutter/foundation.dart';
import '../domain/models/models.dart';
import '../data/repositories/device_repository.dart';
import '../domain/commands/commands.dart';

class DashboardViewModel extends ChangeNotifier {
  final DeviceRepository _repository;
  DeviceStatus _status = const DeviceStatus();

  DashboardViewModel(this._repository) {
    _status = _repository.currentStatus;
    _repository.statusStream.listen((status) {
      _status = status;
      notifyListeners();
    });
  }

  DeviceStatus get status => _status;

  void emergencyStop() {
    EmergencyStopCommand(_repository).execute();
  }
}
