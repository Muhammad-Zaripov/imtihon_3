import '../models/doctor_models.dart';
import '../repository/doctor_repository.dart';

class DoctorViewmodel {
  static final _singleton = DoctorViewmodel._private();

  DoctorViewmodel._private();

  factory DoctorViewmodel() {
    return _singleton;
  }

  List<DoctorModel> doctors = [];
  DoctorRepository doctorRepo = DoctorRepository();

  Future<void> init() async {
    doctors = await doctorRepo.getDoctors();
  }

  Future<void> refresh() async {
    await init();
  }

  Future<bool> add(DoctorModel model) async {
    final success = await doctorRepo.addDoctor(model);
    if (success) {
      await refresh();
    }
    return success;
  }

  Future<bool> updateDoctor(DoctorModel doctor) async {
    bool status = await doctorRepo.updateDoctor(doctor);
    if (status) {
      final index = doctors.indexWhere((e) => e.id == doctor.id);
      doctors[index] = doctor;
    }
    return status;
  }

  List<DoctorModel> get all => doctors;

  DoctorModel? getDoctorFromId(String id) {
    final index = doctors.indexWhere((e) => e.id == id);
    if (index != -1) {
      return doctors[index];
    }
    doctorRepo.getDoctorFromId(id).then((value) {
      return value;
    });
    return null;
  }
}
