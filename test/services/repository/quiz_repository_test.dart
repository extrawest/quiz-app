import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/data/mappers/boolean_quiz_mapper.dart';
import 'package:quiz_app/data/mappers/multi_options_quiz_mapper.dart';
import 'package:quiz_app/data/models/failure.dart';
import 'package:quiz_app/data/models/quiz_history_model.dart';
import 'package:quiz_app/data/models/quiz_model.dart';
import 'package:quiz_app/data/models/quiz_type.dart';
import 'package:quiz_app/services/api/mocky_api_client.dart';
import 'package:quiz_app/services/repository/quiz_repository.dart';
import 'package:quiz_app/services/repository/quiz_repository_impl.dart';

import 'quiz_repository_test.mocks.dart';

@GenerateMocks([
  MockyApiClient,
])
void main() {
  final booleanQuizMapper = BooleanQuizMapper();
  final multiOptionsQuizMapper = MultiOptionsQuizMapper();
  final apiClient = MockMockyApiClient();

  final quizRepository = QuizRepositoryImpl(
    apiClient: apiClient,
    booleanQuizMapper: booleanQuizMapper,
    multiOptionsQuizMapper: multiOptionsQuizMapper,
  );

  group('$QuizRepository test,', () {
    test(
      '''WHEN retrieveQuizesForType is called 
      AND quizType is ${QuizType.boolean} 
      THEN Either.right of quiz model is returned 
      AND getBooleanQuizes is called once''',
      () async {
        when(apiClient.getBooleanQuizes()).thenAnswer(
          (_) => Future.value([]),
        );

        final quizes = await quizRepository.retrieveQuizesForType(
          quizeType: QuizType.boolean,
        );

        verify(apiClient.getBooleanQuizes()).called(1);

        expect(
          quizes,
          isA<Right<Failure, List<QuizModel>>>(),
        );
      },
    );

    test(
      '''WHEN retrieveQuizesForType is called 
      AND quizType is ${QuizType.multiOptions} 
      THEN Either.right of quiz model is returned 
      AND getMultiOptionsQuizes is called once''',
      () async {
        when(apiClient.getMultiOptionsQuizes()).thenAnswer(
          (_) => Future.value([]),
        );

        final quizes = await quizRepository.retrieveQuizesForType(
          quizeType: QuizType.multiOptions,
        );

        verify(apiClient.getMultiOptionsQuizes()).called(1);

        expect(
          quizes,
          isA<Right<Failure, List<QuizModel>>>(),
        );
      },
    );

    test(
      '''WHEN retrieveQuizesForType is called 
      AND exception is thrown 
      THEN Either.left of failure is returned''',
      () async {
        when(apiClient.getMultiOptionsQuizes()).thenThrow(Exception());

        final quizes = await quizRepository.retrieveQuizesForType(
          quizeType: QuizType.multiOptions,
        );

        expect(
          quizes,
          isA<Left<Failure, List<QuizModel>>>(),
        );
      },
    );
  });
}
