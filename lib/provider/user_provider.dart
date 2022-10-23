import 'package:eran_by_saving/hive/hive_data/user_data.dart';
import 'package:eran_by_saving/model/user_model.dart';
import 'package:eran_by_saving/repository/user/user_repository.dart';
import 'package:eran_by_saving/repository/user/user_repository_imp.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserRepository repository = UserRepositoryImp();
  User? user;

  Future<User?> getUser() async {
    const userData = UserData();
    return await userData.getUser();
  }

  Future<void> saveLocalUser(User user) async {
    const userData = UserData();
    await userData.save(user);
  }

  Future<void> setUser(User _user) async {
    // if (user != null) {
    //   await saveLocalUser(_user); //copyTo
    // } else {
    //   await saveLocalUser(_user);
    // }
    await saveLocalUser(_user);
    user = _user;
    notifyListeners();
  }

  Future<void> loadUser() async {
    user = await getUser();
    notifyListeners();
  }

  Future<void> logout() async {
    const userData = UserData();
    await userData.removeUser();
    user = null;
  }

  Future<void> login() async {
    var userLogged = await repository.loginUser();
    //   if (userLogged != null) {
    //     user = userLogged;
    //     await saveLocalUser(userLogged);
    //     notifyListeners();
    //   }
  }
}
