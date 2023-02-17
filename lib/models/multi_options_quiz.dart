import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/models/mixin/quiz_history_convertable.dart';

part 'multi_options_quiz.freezed.dart';
part 'multi_options_quiz.g.dart';

@freezed
class MultiOptionsQuiz with _$MultiOptionsQuiz, QuizHistoryConvertable {
  const factory MultiOptionsQuiz({
    required int id,
    required String question,
    required List<String> answers,
    required String rightAnswer,
  }) = _MultiOptionsQuiz;

  const MultiOptionsQuiz._();

  factory MultiOptionsQuiz.fromJson(Map<String, dynamic> json) =>
      _$MultiOptionsQuizFromJson(json);

  @override
  String get rightAnswerString => rightAnswer;
}
