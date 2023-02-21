import '../dto/multi_options_quiz_dto.dart';
import '../mappers/mapper.dart';
import '../models/quiz_model.dart';

class MultiOptionsQuizMapper extends Mapper<MultiOptionsQuizDTO, QuizModel> {
  @override
  QuizModel apply(MultiOptionsQuizDTO data) {
    return QuizModel(
      question: data.question,
      answers: data.answers,
      rightAnswer: data.rightAnswer,
    );
  }
}
