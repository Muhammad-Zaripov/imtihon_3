import 'package:imtihon_3/models/user_model.dart';
import 'package:imtihon_3/repository/user_remote_repository.dart';

class UserViewmodel {
  static final _singleton = UserViewmodel._private();

  UserViewmodel._private();

  factory UserViewmodel() {
    return _singleton;
  }

  final userRepo = UserRemoteRepository();
  List<UserModel> users = [];

  Future<void> init() async {
    await getUsers();
  }

  Future<void> getUsers() async {
    users = await userRepo.getUser();
  }

  Future<bool> addUser(UserModel user) async {
    return await userRepo.addUser(user);
  }

  Future<bool> updateUser(UserModel user) async {
    return await userRepo.updateUser(user);
  }

  Future<String?> checkUser(String email, String password) async {
    if (users.isEmpty) {
      return "Tizimda foydalanuvchilar yo'q";
    }
    for (var element in users) {
      if (element.email.toLowerCase() == email.toLowerCase()) {
        if (element.password == password) {
          return null;
        }
        return "Parol xato";
      }
    }

    return "Bunday foydalanuvchi tizimda mavjud emas";
  }

  Future<bool> haveUser(String email) async {
    if (users.isEmpty) {
      return false;
    }
    for (var element in users) {
      if (element.email.toLowerCase() == email.toLowerCase()) {
        return true;
      }
    }
    return false;
  }
}
