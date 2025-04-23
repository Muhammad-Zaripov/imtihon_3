import 'package:imtihon_3/data_sourses/remote_datasoerse/appoinment_remote_datasource.dart';
import 'package:imtihon_3/models/appoinment_models.dart';

class AppointmentController {
  AppointmentController._privateConstructor();
  static final AppointmentController _instance =
      AppointmentController._privateConstructor();
  factory AppointmentController() => _instance;

  final AppoinmentRemoteDatasource _remote = AppoinmentRemoteDatasource();

  List<AppointmentModel> _appointments = [];

  Future<void> init() async {
    _appointments = await _remote.getAppoinments();
  }

  List<AppointmentModel> getByStatus(String status) {
    return _appointments.where((e) => e.status == "completed").toList();
  }

  Future<bool> updateStatus(String id, String newStatus) async {
    final index = _appointments.indexWhere((e) => e.id == id);
    if (index == -1) return false;

    final updated = _appointments[index].copyWith(status: newStatus);
    final success = await _remote.updateAppoinment(updated);

    if (success) {
      _appointments[index] = updated;
    }

    return success;
  }

  Future<void> refresh() async {
    await init();
  }

  Future<bool> add(AppointmentModel model) async {
    final success = await _remote.addAppoinment(model);
    if (success) {
      await refresh();
    }
    return success;
  }

  List<AppointmentModel> get all => _appointments;
}
