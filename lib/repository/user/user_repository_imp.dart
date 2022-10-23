import 'package:eran_by_saving/model/user_model.dart';
import 'package:eran_by_saving/repository/user/user_repository.dart';

class UserRepositoryImp extends UserRepository {
  @override
  Future<User?> loginUser() async {
    await Future.delayed(const Duration(milliseconds: 4500));
    return User(
      id: "123",
      name: "José Luis Octavio Siapo Rodríguez",
      firebaseId: "",
      image:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      tokenExpiration: DateTime.now(),
      token: "",
    );
  }
}
