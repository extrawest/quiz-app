import 'package:quiz_app/models/quiz_history_item.dart';

mixin QuizHistoryConvertable {
  String get question;
  String get rightAnswerString;

  QuizHistoryItem get historyItem {
    return QuizHistoryItem(
      question: question,
      rightAnswer: rightAnswerString,
    );
  }
}
