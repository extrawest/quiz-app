import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/history_repository.dart';
import '../../domain/repository/history_repository_impl.dart';
import '../data/api/mocky_api_client.dart';
import '../data/mapper/boolean_quiz_mapper.dart';
import '../data/mapper/multi_options_quiz_mapper.dart';
import '../data/repository/quiz_repository.dart';
import '../domain/repository/quiz_repository_impl.dart';

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
