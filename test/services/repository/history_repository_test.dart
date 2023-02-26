import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/data/models/failure.dart';
import 'package:quiz_app/data/models/quiz_history_model.dart';
import 'package:quiz_app/services/repository/history_repository.dart';
import 'package:quiz_app/services/repository/history_repository_impl.dart';

import 'history_repository_test.mocks.dart';

@GenerateMocks([
  Box,
  QuizHistoryModel,
])
void main() {
  final box = MockBox<QuizHistoryModel>();
  const keys = ['1', '2'];
  final historyRepository = HistoryRepositoryImpl(box: box);
  final quizHistoryModel = MockQuizHistoryModel();

  group('$HistoryRepository test', () {
    test(
      'WHEN restoreQuizHistory is called THEN Either.right of history model is returned',
      () async {
        when(box.keys).thenReturn(keys);
        when(box.get(any)).thenReturn(quizHistoryModel);

        expect(
          await historyRepository.restoreQuizHistory(),
          isA<Right<Failure, List<QuizHistoryModel>>>(),
        );
      },
    );

    test(
      'WHEN restoreQuizHistory is called AND exception is thrown THEN Either.left of failure is returned',
      () async {
        when(box.keys).thenReturn(keys);
        when(box.get(any)).thenThrow(Exception());
        expect(
          await historyRepository.restoreQuizHistory(),
          isA<Left<Failure, List<QuizHistoryModel>>>(),
        );
      },
    );
  });
}
