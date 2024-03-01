import '../models/user.dart';
import './auth_datasource.dart';

class AuthRepository {
  final AuthDataSource _dataSource = AuthDataSource();

  Future<Result<LoginResult, User>> login({required String email, required String password}) {
    final result = _dataSource.login(email: email, password: password);
    return result;
  }
}
