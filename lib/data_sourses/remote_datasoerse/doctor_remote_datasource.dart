import 'dart:convert';

import 'package:imtihon_3/models/doctor_models.dart';
import 'package:http/http.dart' as http;

class DoctorRemoteDatasource {
  final _baseUrl =
      "https://shifoxona-2d5bd-default-rtdb.asia-southeast1.firebasedatabase.app/doctors";

  Future<List<DoctorModel>> getDoctors() async {
    try {
      final url = Uri.parse("$_baseUrl.json");

      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data.isEmpty) {
          return [];
        }
        List<DoctorModel> doctors = [];
        data.forEach((key, value) {
          value["id"] = key;
          doctors.add(DoctorModel.fromJson(value));
        });
        return doctors;
      }
      return [];
    } catch (e, s) {
      print("xato DoctorRemote - $e");
      print("joy DoctorRemote Fayli - $s");
    }
    return [];
  }

  Future<bool> addDoctor(DoctorModel doctor) async {
    try {
      final url = Uri.parse("$_baseUrl.json");

      final response = await http.post(url, body: jsonEncode(doctor.toJson()));

      return response.statusCode == 200;
    } catch (e, s) {
      print("xato addDoctor - $e");
      print("joy addDoctor - $s");
      return false;
    }
  }

  Future<bool> updateDoctor(DoctorModel doctor) async {
    try {
      final url = Uri.parse("$_baseUrl/${doctor.id}.json");

      final response = await http.patch(url, body: jsonEncode(doctor.toJson()));

      return response.statusCode == 200;
    } catch (e, s) {
      print("xato updateDoctor - $e");
      print("joy updateDoctor - $s");
      return false;
    }
  }
}
