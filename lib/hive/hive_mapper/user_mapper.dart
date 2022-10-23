import 'package:eran_by_saving/hive/hive_model/user_hive_model.dart';

import '../../model/user_model.dart';

extension ToUserParse on UserHive {
  User toUser() {
    return User(
      id: id,
      name: name,
      image: image,
      firebaseId: firebaseId,
      token: token,
      tokenExpiration: DateTime.parse(tokenExpiration),
    );
  }
}

extension ToUserHiveParse on User {
  UserHive toUserHive() {
    return UserHive(
      id: id,
      name: name,
      image: image,
      firebaseId: firebaseId,
      token: token,
      tokenExpiration: tokenExpiration.toString(),
    );
  }
}

// extension ToSettingsListParse on List<UserHive> {
//   List<User> toListUser() {
//     final List<User> listOfUsers = [];

//     for (var setting in this) {
//       listOfUsers.add(setting.toUser());
//     }

//     return listOfUsers;
//   }
// }

// extension ToUserHiveListParse on List<User> {
//   List<UserHive> toListUserHive() {
//     final List<UserHive> listOfUserHive = [];

//     for (var user in this) {
//       listOfUserHive.add(user.toUserHive());
//     }

//     return listOfUserHive;
//   }
// }
