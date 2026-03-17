import 'package:flutter/foundation.dart';
import '../domain/models/models.dart';
import '../data/repositories/device_repository.dart';
import '../domain/commands/command.dart';
import '../domain/commands/result.dart';

class DashboardViewModel extends ChangeNotifier {
  final DeviceRepository _repository;
  DeviceStatus _status = const DeviceStatus();

  late final Command0<void> emergencyStopCommand;

  DashboardViewModel(this._repository) {
    emergencyStopCommand = Command0(_repository.emergencyStop);

    _status = _repository.currentStatus;
    _repository.statusStream.listen((status) {
      _status = status;
      notifyListeners();
    });
  }

  DeviceStatus get status => _status;

  Future<Result<void>> emergencyStop() async {
    await emergencyStopCommand.execute();
    final result = emergencyStopCommand.result!;
    switch (result) {
      case Ok():
        notifyListeners();
        return result;
      case Error():
        notifyListeners();
        return result;
    }
  }
}
