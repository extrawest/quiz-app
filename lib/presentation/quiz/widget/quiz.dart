import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../../../domain/model/quiz_model.dart';
import '../../utils/iterable_join_with.dart';
import 'answer.dart';
import 'question.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({
    super.key,
    required this.quizModel,
    required this.onAnswer,
  });

  final QuizModel quizModel;
  final ValueSetter<String> onAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Question(question: quizModel.question),
        ...quizModel.answers.mapIndexed(
          (index, answer) => Answer(
            index: index,
            answer: answer,
            onPressed: () => onAnswer(answer),
          ),
        ),
      ].joinWith(const SizedBox(height: 16.0)),
    );
  }
}
