import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/blocs/quiz_cubit/quiz_cubit.dart';
import 'package:quiz_app/blocs/quiz_cubit/quiz_state.dart';
import 'package:quiz_app/data/models/failure.dart';
import 'package:quiz_app/data/models/quiz_model.dart';
import 'package:quiz_app/data/models/quiz_result_model.dart';
import 'package:quiz_app/data/models/quiz_type.dart';
import 'package:quiz_app/services/repository/history_repository.dart';
import 'package:quiz_app/services/repository/quiz_repository.dart';

import 'quiz_cubit_test.mocks.dart';

@GenerateMocks([
  HistoryRepository,
  QuizRepository,
  QuizModel,
  QuizResultModel,
])
void main() {
  group('$QuizCubit test', () {
    final historyRepository = MockHistoryRepository();
    final quizRepository = MockQuizRepository();
    final quizes = [MockQuizModel()];
    final quiz = MockQuizModel();
    const rightAnswer = 'RIGHT ANSWER';
    final quizResult = MockQuizResultModel();
    final initialState = QuizState.initial();
    const failure = Failure(message: 'TEST');
    const quizType = QuizType.boolean;
    blocTest(
      'WHEN user loads quizes THEN quizes is returned to state',
      setUp: () => when(
        quizRepository.retrieveQuizesForType(quizeType: quizType),
      ).thenAnswer(
        (_) => Future.value(Right(quizes)),
      ),
      build: () => QuizCubit(
        historyRepository: historyRepository,
        quizRepository: quizRepository,
        quizType: quizType,
      ),
      act: (cubit) => cubit.loadQuizes(),
      expect: () => [
        initialState.copyWith(isLoading: true),
        initialState.copyWith(isLoading: true, quizes: quizes),
        initialState.copyWith(isLoading: false, quizes: quizes),
      ],
    );

    blocTest(
      'WHEN user loads quizes AND error is occured THEN failure is returned to state',
      setUp: () => when(
        quizRepository.retrieveQuizesForType(quizeType: quizType),
      ).thenAnswer(
        (_) => Future.value(const Left(failure)),
      ),
      build: () => QuizCubit(
        historyRepository: historyRepository,
        quizRepository: quizRepository,
        quizType: quizType,
      ),
      act: (cubit) => cubit.loadQuizes(),
      expect: () => [
        initialState.copyWith(isLoading: true),
        initialState.copyWith(isLoading: true, failure: failure),
        initialState.copyWith(isLoading: false, failure: failure),
      ],
    );

    blocTest(
      '''WHEN user passes the quiz 
      THEN quiz result is returned to state is returned to state 
      AND first quiz is removed from state''',
      setUp: () => when(quiz.pass(rightAnswer)).thenAnswer((_) => quizResult),
      build: () => QuizCubit(
        historyRepository: historyRepository,
        quizRepository: quizRepository,
        quizType: quizType,
      ),
      seed: () => initialState.copyWith(quizes: [...quizes, quiz]),
      act: (cubit) => cubit.passQuiz(answer: rightAnswer),
      expect: () => [
        initialState.copyWith(quizes: quizes, result: [quizResult]),
      ],
    );

    blocTest(
      'WHEN user completes the quiz THEN HistoryRepository.saveQuizHistory is called',
      setUp: () => when(
        historyRepository.saveQuizHistory(
            quizHistoryModel: anyNamed('quizHistoryModel')),
      ).thenAnswer(
        (_) => Future.value(const Right(null)),
      ),
      build: () => QuizCubit(
        historyRepository: historyRepository,
        quizRepository: quizRepository,
        quizType: quizType,
      ),
      act: (cubit) => cubit.completeQuiz(),
      verify: (_) => verify(historyRepository.saveQuizHistory(
              quizHistoryModel: anyNamed('quizHistoryModel')))
          .called(1),
    );
  });
}
