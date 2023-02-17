import '../../domain/model/quiz_model.dart';
import '../dto/multi_options_quiz_dto.dart';
import '../mapper/mapper.dart';

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
