import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../presentation/splash/splash_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: SplashPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
