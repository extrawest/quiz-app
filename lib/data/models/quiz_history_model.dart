import 'package:freezed_annotation/freezed_annotation.dart';

import 'quiz_result_model.dart';

part 'quiz_history_model.freezed.dart';
part 'quiz_history_model.g.dart';

@freezed
class QuizHistoryModel with _$QuizHistoryModel {
  const factory QuizHistoryModel({
    required DateTime date,
    required List<QuizResultModel> quizes,
  }) = _QuizHistoryModel;

  factory QuizHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$QuizHistoryModelFromJson(json);
}
