abstract interface class AuthDataSource {
  Future<void> login(String email, String password);
}

class HttpAuthDataSource implements AuthDataSource {
  @override
  Future<void> login(String email, String password) {
    throw UnimplementedError();
  }
}
