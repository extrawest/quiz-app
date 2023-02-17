import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_result_model.freezed.dart';
part 'quiz_result_model.g.dart';

@freezed
class QuizResultModel with _$QuizResultModel {
  const factory QuizResultModel({
    required String question,
    required String answer,
    required bool isRight,
  }) = _QuizResultModel;

  factory QuizResultModel.fromJson(Map<String, dynamic> json) =>
      _$QuizResultModelFromJson(json);
}
