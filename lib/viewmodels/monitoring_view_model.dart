import 'package:flutter/foundation.dart';
import '../domain/models/models.dart';
import '../data/repositories/device_repository.dart';

class MonitoringViewModel extends ChangeNotifier {
  final DeviceRepository _repository;
  DeviceStatus _status = const DeviceStatus();
  final List<double> _tempHistory = [];

  MonitoringViewModel(this._repository) {
    _status = _repository.currentStatus;
    _repository.statusStream.listen((status) {
      _status = status;
      _tempHistory.add(status.currentChamberTemp);
      if (_tempHistory.length > 100) _tempHistory.removeAt(0);
      notifyListeners();
    });
  }

  DeviceStatus get status => _status;
  List<double> get tempHistory => _tempHistory;
}
