import 'package:hive_flutter/adapters.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 1)
class UserHive extends HiveObject {
  @HiveField(0, defaultValue: false)
  final bool isLogged = false;
  @HiveField(1, defaultValue: "")
  final String id;
  @HiveField(2, defaultValue: "")
  final String name;
  @HiveField(3, defaultValue: "")
  final String image;
  @HiveField(4, defaultValue: "")
  final String firebaseId;
  @HiveField(5, defaultValue: "")
  final String token;
  @HiveField(6, defaultValue: "")
  final String tokenExpiration;

  UserHive({
    required this.id,
    required this.name,
    required this.image,
    required this.firebaseId,
    required this.token,
    required this.tokenExpiration,
  });
}
