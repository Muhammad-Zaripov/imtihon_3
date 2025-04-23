import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/user_model.dart';

class UserRemoteDatasource {
  final _baseUrl =
      "https://shifoxona-2d5bd-default-rtdb.asia-southeast1.firebasedatabase.app/users";

  Future<List<UserModel>> getUsers() async {
    try {
      final url = Uri.parse("$_baseUrl.json");

      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data.isEmpty) {
          return [];
        }
        List<UserModel> users = [];
        data.forEach((key, value) {
          value["id"] = key;
          users.add(UserModel.fromJson(value));
        });
        return users;
      }
      return [];
    } catch (e, s) {
      print("xato - $e");
      print("joy - $s");
    }
    return [];
  }

  Future<bool> addUser(UserModel user) async {
    try {
      final url = Uri.parse("$_baseUrl.json");
      final response = await http.post(url, body: jsonEncode(user.toJson()));
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print("Add xatolik: $e");
    }
    return false;
  }

  Future<bool> updateUser(UserModel user) async {
    try {
      final url = Uri.parse("$_baseUrl/${user.id}.json");
      final response = await http.patch(url, body: jsonEncode(user.toJson()));
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print("Update xatolik: $e");
    }
    return false;
  }

  Future<bool> changePassword({
    required String userId,
    required String newPassword,
  }) async {
    try {
      final url = Uri.parse("$_baseUrl/$userId.json");

      final response = await http.patch(
        url,
        body: jsonEncode({"password": newPassword}),
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print("Parolni yangilashda xatolik: $e");
    }
    return false;
  }

  Future<UserModel?> getUserFromId(String id) async {
    try {
      final url = Uri.parse("$_baseUrl/$id.json");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        data["id"] = id;
        return UserModel.fromJson(data);
      }
      return null;
    } catch (e, s) {
      print("xato updateAppoinment - $e");
      print("joy updateAppoinment - $s");
    }
  }
}
