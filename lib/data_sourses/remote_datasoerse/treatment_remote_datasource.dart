import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/treatment_model.dart';

class TreatmentRemoteDatasource {
  final _baseUrl =
      "https://shifoxona-2d5bd-default-rtdb.asia-southeast1.firebasedatabase.app/treatments";

  Future<List<TreatmentModel>> getData() async {
    try {
      final url = Uri.parse("$_baseUrl.json");

      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data.isEmpty) {
          return [];
        }
        List<TreatmentModel> treatments = [];
        data.forEach((key, value) {
          value["id"] = key;
          treatments.add(TreatmentModel.fromJson(value));
        });
        return treatments;
      }
      return [];
    } catch (e, s) {
      print("xato getTreatment - $e");
      print("joy getTreatment Fayli - $s");
    }
    return [];
  }

  Future<bool> addTreatment(TreatmentModel treatment) async {
    try {
      final url = Uri.parse("$_baseUrl.json");

      final response = await http.post(
        url,
        body: jsonEncode(treatment.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e, s) {
      print("xato addTreatment - $e");
      print("joy addTreatment - $s");
    }
    return false;
  }

  Future<bool> updateTreatment(TreatmentModel treatment) async {
    try {
      final url = Uri.parse("$_baseUrl/${treatment.id}.json");

      final response = await http.patch(
        url,
        body: jsonEncode(treatment.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e, s) {
      print("xato updateTreatment - $e");
      print("joy updateTreatment - $s");
    }
    return false;
  }

  Future<TreatmentModel?> getTrFromId(String id) async {
    try {
      final url = Uri.parse("$_baseUrl/$id.json");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        data["id"] = id;
        return TreatmentModel.fromJson(data);
      }
      return null;
    } catch (e, s) {
      print("xato updateAppoinment - $e");
      print("joy updateAppoinment - $s");
    }
  }
}
