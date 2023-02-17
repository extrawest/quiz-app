import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_history_item.freezed.dart';
part 'quiz_history_item.g.dart';

@freezed
class QuizHistoryItem with _$QuizHistoryItem {
  const factory QuizHistoryItem({
    required String question,
    required String rightAnswer,
  }) = _QuizHistoryItem;

  factory QuizHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$QuizHistoryItemFromJson(json);
}
