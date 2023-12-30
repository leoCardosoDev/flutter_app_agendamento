import 'package:flutter/material.dart';

import '../core/route/app_routes.dart';
import '../core/flavor/flavor_config.dart';

void bootstrap(FlavorConfig config) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
