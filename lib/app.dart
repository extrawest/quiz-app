import 'package:flutter/material.dart';
import 'package:quiz_app/router/router.dart';

import 'presentation/app_repository_provoider.dart';

final _router = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRepositoryProvider(
      child: MaterialApp.router(
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
      ),
    );
  }
}
