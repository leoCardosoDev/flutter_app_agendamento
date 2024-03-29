import '../../../core/helpers/result.dart';
import '../models/user.dart';
import './auth_datasource.dart';
import 'results/login_failed_result.dart';

class AuthRepository {
  final AuthDataSource _dataSource = AuthDataSource();

  Future<Result<LoginFailedResult, User>> login({required String email, required String password}) async  {
    final result = await _dataSource.login(email: email, password: password);
    if (result case Failure(error: final error)) {
      print(error);
    }
    return result;
  }
}
