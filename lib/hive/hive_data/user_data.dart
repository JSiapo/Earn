import 'package:eran_by_saving/hive/hive_mapper/user_mapper.dart';
import 'package:eran_by_saving/hive/hive_model/user_hive_model.dart';
import 'package:eran_by_saving/model/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserData {
  const UserData();

  Future<int> save(User user) async {
    final Box<UserHive> box = await Hive.openBox<UserHive>('user');
    await box.clear();
    return box.add(user.toUserHive());
  }

  Future<User?> getUser() async {
    final Box<UserHive> box = await Hive.openBox<UserHive>('user');
    if (box.values.isNotEmpty) {
      return box.values.last.toUser();
    }
    return null;
  }

  Future<void> removeUser() async {
    final Box<UserHive> box = await Hive.openBox<UserHive>('user');
    await box.clear();
  }
}
