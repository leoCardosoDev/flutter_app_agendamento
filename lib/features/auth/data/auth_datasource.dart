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

  Future<Result> login({required String email, required String password}) async {
    try {
      final response = await _dio.post('/v1-sign-in', data: { 'email': email, 'password': password });
      return Success(User.fromMap(response.data['result']));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Failure(LoginFailedResult.incorrectCredentials);
      }
      return const Failure(LoginFailedResult.unknownError);
    } catch (_) {
      return const Failure(LoginFailedResult.unknownError);
    }
  }
}

enum LoginFailedResult {
  incorrectCredentials,
  offline,
  unknownError,
  userNotActive
}

class Result {
  const Result();
}

class Success extends Result {
  final dynamic object;
  const Success(this.object): super();
}

class Failure extends Result {
  final dynamic error;
  const Failure(this.error): super();
}
