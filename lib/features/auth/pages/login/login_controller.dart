import '../../../../core/helpers/result.dart';
import '../../data/auth_repository.dart';

class LoginController {
  final AuthRepository authRepository = AuthRepository();

  Future<void> login() async {
    final result = await authRepository.login(email: 'email', password: 'ssdd');
    switch(result) {
      case Success(object: final user):
        print('Success ${user.id}');
      case Failure(error: final error):
        print(error);
    }
  }
}
