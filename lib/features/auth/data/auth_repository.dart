import './auth_datasource.dart';

class AuthRepository {
  final AuthDataSource _dataSource = AuthDataSource();

  Future<void> login({required String email, required String password}) {
    return _dataSource.login(email: email, password: password);
  }
}
