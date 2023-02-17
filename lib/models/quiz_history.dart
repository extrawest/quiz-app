import 'package:freezed_annotation/freezed_annotation.dart';

import 'quiz_history_item.dart';

part 'quiz_history.freezed.dart';
part 'quiz_history.g.dart';

@freezed
class QuizHistory with _$QuizHistory {
  const factory QuizHistory({
    required DateTime date,
    required List<QuizHistoryItem> quiz,
  }) = _QuizHistory;

  factory QuizHistory.fromJson(Map<String, dynamic> json) =>
      _$QuizHistoryFromJson(json);
}
