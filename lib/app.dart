import 'package:flutter/material.dart';

import 'core/helpers/result.dart';
import 'core/routes/app_routes.dart';
import 'core/flavors/flavor_config.dart';
import 'features/auth/data/auth_repository.dart';

void bootstrap(FlavorConfig config) {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    final AuthRepository authRepository = AuthRepository();
    final result = await authRepository.login(email: 'leosilva@gmail.com', password: '1234');
    switch(result) {
      case Success(object: final user):
        print('Success ${user.id}');
      case Failure(error: final error):
        print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
