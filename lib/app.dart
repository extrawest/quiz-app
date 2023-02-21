import 'package:flutter/material.dart';

import 'router.dart';
import 'widgets/app_repository_provider.dart';

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
