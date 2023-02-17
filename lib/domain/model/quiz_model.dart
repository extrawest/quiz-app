import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/domain/model/quiz_result_model.dart';

part 'quiz_model.g.dart';
part 'quiz_model.freezed.dart';

@freezed
class QuizModel with _$QuizModel {
  const factory QuizModel({
    required String question,
    required List<String> answers,
    required String rightAnswer,
  }) = _QuizModel;

  const QuizModel._();

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);

  QuizResultModel pass(String answer) => QuizResultModel(
        question: question,
        answer: answer,
        isRight: answer == rightAnswer,
      );
}
