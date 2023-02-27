import 'package:freezed_annotation/freezed_annotation.dart';

part 'boolean_quiz_dto.g.dart';
part 'boolean_quiz_dto.freezed.dart';

@freezed
class BooleanQuizDTO with _$BooleanQuizDTO {
  const factory BooleanQuizDTO({
    required int id,
    required String question,
    required bool rightAnswer,
  }) = _BooleanQuizDTO;

  const BooleanQuizDTO._();

  factory BooleanQuizDTO.fromJson(Map<String, dynamic> json) =>
      _$BooleanQuizDTOFromJson(json);
}
