import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/mappers/boolean_quiz_mapper.dart';
import '../data/mappers/multi_options_quiz_mapper.dart';
import '../services/api/mocky_api_client.dart';
import '../services/repository/history_repository.dart';
import '../services/repository/history_repository_impl.dart';
import '../services/repository/quiz_repository.dart';
import '../services/repository/quiz_repository_impl.dart';

class AppRepositoryProvider extends StatelessWidget {
  const AppRepositoryProvider({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<QuizRepository>(
          create: (context) => QuizRepositoryImpl(
            apiClient: MockyApiClient(Dio()),
            multiOptionsQuizMapper: MultiOptionsQuizMapper(),
            booleanQuizMapper: BooleanQuizMapper(),
          ),
        ),
        RepositoryProvider<HistoryRepository>(
          create: (context) => HistoryRepositoryImpl(),
        ),
      ],
      child: child,
    );
  }
}
