import 'package:flutter/material.dart';
import '../../../data/models/quiz_result_model.dart';
import '../../../utils/iterable_join_with.dart';

class QuizResultTile extends StatelessWidget {
  const QuizResultTile({
    super.key,
    required this.quizResult,
  });

  final QuizResultModel quizResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(quizResult.question),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(quizResult.answer),
              _QuizStatus(isRight: quizResult.isRight)
            ].joinWith(const SizedBox(width: 8)),
          ),
        ],
      ),
    );
  }
}

class _QuizStatus extends StatelessWidget {
  const _QuizStatus({
    super.key,
    required this.isRight,
  });

  final bool isRight;

  Color get color => isRight ? Colors.green : Colors.red;
  String get text => isRight ? 'Correct' : 'Wrong';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color.withOpacity(0.2),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
