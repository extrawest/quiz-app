import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/data/models/quiz_model.dart';
import 'package:quiz_app/data/models/quiz_result_model.dart';

void main() {
  const rightAnswer = 'RIGHT ANSWER';
  const wrongAnswer = 'WRONG ANSWER';
  const question = 'QUESTION';

  const quizModel = QuizModel(
    question: question,
    answers: [],
    rightAnswer: rightAnswer,
  );
  const rightQuizResul = QuizResultModel(
    question: question,
    answer: rightAnswer,
    isRight: true,
  );

  const wrongQuizResul = QuizResultModel(
    question: question,
    answer: wrongAnswer,
    isRight: false,
  );

  group('$QuizModel test', () {
    test(
      'WHEN quiz is passed with right answer THEN proper result is returned',
      () {
        expect(
          quizModel.pass(rightAnswer),
          equals(rightQuizResul),
        );
      },
    );

    test(
      'WHEN quiz is passed with wrong answer THEN proper result is returned',
      () {
        expect(
          quizModel.pass(wrongAnswer),
          equals(wrongQuizResul),
        );
      },
    );
  });
}
