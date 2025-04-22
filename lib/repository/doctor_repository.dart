import 'package:imtihon_3/data_sourses/remote_datasoerse/doctor_remote_datasource.dart';
import 'package:imtihon_3/models/doctor_models.dart';

class DoctorRepository {
  final DoctorRemoteDatasource doctorRemote = DoctorRemoteDatasource();

  Future<List<DoctorModel>> getDoctors() async {
    return doctorRemote.getDoctors();
  }

  Future<bool> addUser(DoctorModel doctor) async {
    return doctorRemote.addDoctor(doctor);
  }

  Future<bool> updateUser(DoctorModel doctor) async {
    return doctorRemote.updateDoctor(doctor);
  }
}
