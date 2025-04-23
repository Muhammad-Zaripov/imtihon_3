import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class UserLocalDatasource {
  Future<void> setUser(UserModel user) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    final data = user.toJson();
    data["id"] = user.id;
    await shp.setString("user", jsonEncode(data));
  }

  Future<UserModel?> getUser() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    final data = shp.getString("user");
    if (data != null) {
      UserModel user = UserModel.fromJson(
        jsonDecode(data) as Map<String, dynamic>,
      );

      return user;
    }
    return null;
  }

  Future<bool> clear() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.clear();
  }
}
