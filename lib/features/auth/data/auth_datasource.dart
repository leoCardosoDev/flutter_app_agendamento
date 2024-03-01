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

  Future<Result<LoginResult, User>> login({required String email, required String password}) async {
    try {
      final response = await _dio.post('/v1-sign-in', data: { 'email': email, 'password': password });
      return Success(User.fromMap(response.data['result']));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Failure(LoginIncorrectCredentials());
      }
      return Failure(LoginUnknownError());
    } catch (_) {
      return Failure(LoginUnknownError());
    }
  }
}

sealed class Result<R, T> {
  const Result();
}

final class Success<R, T> extends Result<R, T> {
  final T object;
  const Success(this.object): super();
}

final class Failure<R, T> extends Result<R, T> {
  final R error;
  const Failure(this.error): super();
}

sealed class LoginResult {}
final class LoginSuccess extends LoginResult {}
final class LoginIncorrectCredentials extends LoginResult {}
final class LoginOffline extends LoginResult {}
final class LoginUnknownError extends LoginResult {}
final class LoginUserNotActive extends LoginResult {}
