import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/history/history_page.dart';
import 'package:quiz_app/screens/quiz/quiz_page.dart';

import 'screens/home/home_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: HomePage,
    ),
    AutoRoute(
      path: '/history',
      page: HistoryPage,
    ),
    AutoRoute(
      path: '/quiz/:quizType',
      page: QuizPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
