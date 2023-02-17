import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/models/mixin/quiz_history_convertable.dart';

part 'boolean_quiz.g.dart';
part 'boolean_quiz.freezed.dart';

@freezed
class BooleanQuiz with _$BooleanQuiz, QuizHistoryConvertable {
  const factory BooleanQuiz({
    required int id,
    required String question,
    required bool rightAnswer,
  }) = _BooleanQuiz;

  const BooleanQuiz._();

  factory BooleanQuiz.fromJson(Map<String, dynamic> json) =>
      _$BooleanQuizFromJson(json);

  @override
  String get rightAnswerString => rightAnswer.toString();
}
