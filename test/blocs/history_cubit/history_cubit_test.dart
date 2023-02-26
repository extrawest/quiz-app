import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/blocs/history_cubit/history_cubit.dart';
import 'package:quiz_app/blocs/history_cubit/history_state.dart';
import 'package:quiz_app/data/models/failure.dart';
import 'package:quiz_app/data/models/quiz_history_model.dart';
import 'package:quiz_app/services/repository/history_repository.dart';
import 'history_cubit_test.mocks.dart';

@GenerateMocks([
  HistoryRepository,
  QuizHistoryModel,
])
void main() {
  group('$HistoryCubit test', () {
    final historyRepository = MockHistoryRepository();
    final quizHistory = [MockQuizHistoryModel()];
    final initialState = HistoryState.initial();
    const failure = Failure(message: 'TEST');

    blocTest(
      'WHEN user loads history THEN quizHistory is returned to state',
      setUp: () => when(historyRepository.restoreQuizHistory()).thenAnswer(
        (_) => Future.value(Right(quizHistory)),
      ),
      build: () => HistoryCubit(historyRepository: historyRepository),
      act: (cubit) => cubit.loadHistory(),
      expect: () => [
        initialState.copyWith(isLoading: true),
        initialState.copyWith(isLoading: true, history: quizHistory),
        initialState.copyWith(isLoading: false, history: quizHistory),
      ],
    );

    blocTest(
      'WHEN user loads history AND error is occured THEN failure is returned to state',
      setUp: () => when(historyRepository.restoreQuizHistory()).thenAnswer(
        (_) => Future.value(const Left(failure)),
      ),
      build: () => HistoryCubit(historyRepository: historyRepository),
      act: (cubit) => cubit.loadHistory(),
      expect: () => [
        initialState.copyWith(isLoading: true),
        initialState.copyWith(isLoading: true, failure: failure),
        initialState.copyWith(isLoading: false, failure: failure),
      ],
    );
  });
}
