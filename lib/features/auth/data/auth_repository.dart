import './auth_datasource.dart';

class AuthRepository {
  final AuthDataSource _dataSource = AuthDataSource();

  Future<void> login(String email, String password) {
    return _dataSource.login(email, password);
  }
}
