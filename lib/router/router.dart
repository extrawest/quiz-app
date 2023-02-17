import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/quiz/quiz_page.dart';
import '../presentation/home/home_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: HomePage,
    ),
    AutoRoute(
      path: '/quiz/:quizType',
      page: QuizPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
