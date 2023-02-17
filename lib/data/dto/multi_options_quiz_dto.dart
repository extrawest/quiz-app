import 'package:freezed_annotation/freezed_annotation.dart';

part 'multi_options_quiz_dto.freezed.dart';
part 'multi_options_quiz_dto.g.dart';

@freezed
class MultiOptionsQuizDTO with _$MultiOptionsQuizDTO {
  const factory MultiOptionsQuizDTO({
    required int id,
    required String question,
    required List<String> answers,
    required String rightAnswer,
  }) = _MultiOptionsQuizDTO;

  const MultiOptionsQuizDTO._();

  factory MultiOptionsQuizDTO.fromJson(Map<String, dynamic> json) =>
      _$MultiOptionsQuizDTOFromJson(json);
}
