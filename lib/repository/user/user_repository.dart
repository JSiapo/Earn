import 'package:eran_by_saving/model/user_model.dart';

abstract class UserRepository {
  Future<User?> loginUser();
}
