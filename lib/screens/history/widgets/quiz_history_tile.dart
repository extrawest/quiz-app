import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/data/models/quiz_history_model.dart';
import 'package:quiz_app/screens/history/widgets/quiz_result_tile.dart';
import 'package:quiz_app/utils/iterable_join_with.dart';

class QuizHistoryTile extends StatelessWidget {
  const QuizHistoryTile({
    super.key,
    required this.onPressed,
    required this.historyItem,
  });

  final VoidCallback onPressed;
  final QuizHistoryModel historyItem;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(bottom: 16),
      title: Text(DateFormat().format(historyItem.date)),
      subtitle: Text(
        '${historyItem.rightCount}/${historyItem.quizes.length} correct answers',
      ),
      children: historyItem.quizes
          .map((quizResult) => QuizResultTile(quizResult: quizResult))
          .joinWith(const SizedBox(height: 12)),
    );
  }
}
