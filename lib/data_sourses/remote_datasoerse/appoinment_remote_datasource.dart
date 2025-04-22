import 'dart:convert';

import 'package:imtihon_3/models/appoinment_models.dart';
import 'package:http/http.dart' as http;

class AppoinmentRemoteDatasource {
  final _baseUrl =
      "https://shifoxona-2d5bd-default-rtdb.asia-southeast1.firebasedatabase.app/appoinments.json";

  Future<List<AppointmentModel>> getAppoinments() async {
    try {
      final url = Uri.parse("$_baseUrl.json");

      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data.isEmpty) {
          return [];
        }
        List<AppointmentModel> appoinments = [];
        data.forEach((key, value) {
          value["id"] = key;
          appoinments.add(AppointmentModel.fromJson(value));
        });
        return appoinments;
      }
      return [];
    } catch (e, s) {
      print("xato getAppoinment - $e");
      print("joy getAppoinment Fayli - $s");
    }
    return [];
  }

  Future<bool> addAppoinment(AppointmentModel appointment) async {
    try {
      final url = Uri.parse("$_baseUrl.json");

      final response = await http.post(
        url,
        body: jsonEncode(appointment.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e, s) {
      print("xato addAppoinment - $e");
      print("joy addAppoinment - $s");
    }
    return false;
  }

  Future<bool> updateAppoinment(AppointmentModel appointment) async {
    try {
      final url = Uri.parse("$_baseUrl/${appointment.id}.json");

      final response = await http.patch(
        url,
        body: jsonEncode(appointment.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e, s) {
      print("xato updateAppoinment - $e");
      print("joy updateAppoinment - $s");
    }
    return false;
  }
}
