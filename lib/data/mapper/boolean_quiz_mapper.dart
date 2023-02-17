import '../../domain/model/quiz_model.dart';
import '../dto/boolean_quiz_dto.dart';
import '../mapper/mapper.dart';

class BooleanQuizMapper extends Mapper<BooleanQuizDTO, QuizModel> {
  @override
  QuizModel apply(BooleanQuizDTO data) {
    return QuizModel(
      question: data.question,
      answers: [true, false].map(stringFromBoolean).toList(),
      rightAnswer: stringFromBoolean(data.rightAnswer),
    );
  }

  String stringFromBoolean(bool value) {
    final string = value.toString();
    return '${string[0].toUpperCase()}${string.substring(1).toLowerCase()}';
  }
}
