import 'package:fpdart/fpdart.dart';

import '../../domain/model/failure.dart';
import '../../domain/model/quiz_history_model.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<QuizHistoryModel>>> restoreQuizHistory();
  Future<Either<Failure, void>> saveQuizHistory({
    required QuizHistoryModel quizHistoryModel,
  });
}
