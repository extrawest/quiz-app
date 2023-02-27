import 'package:flutter/material.dart';
import 'package:quiz_app/theme/theme.dart';

import 'router.dart';
import 'widgets/app_repository_provider.dart';

final _router = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRepositoryProvider(
      child: MaterialApp.router(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerDelegate: _router.delegate(),
        routeInformationParser: _router.defaultRouteParser(),
      ),
    );
  }
}
