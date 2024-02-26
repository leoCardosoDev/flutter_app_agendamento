import 'package:dio/dio.dart';

import '../models/user.dart';

class AuthDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://parseapi.back4app.com/functions',
      headers: {
        'X-Parse-Application-Id': 'W4oEod3P5qgah2jRMnZcZkCK4QsrJ34FawWsB10h',
        'X-Parse-REST-API-Key': 'hewuQrYiZfKHwWhUHS1XmUz3hWme0NPI9tjkt0Rh'
      }
    )
  );

  Future<User> login({required String email, required String password}) async {
    final response = await _dio.post('/v1-sign-in', data: { 'email': email, 'password': password });
    return User.fromMap(response.data['result']);
  }
}
