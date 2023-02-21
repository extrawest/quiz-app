import 'package:fpdart/fpdart.dart';

import '../../data/models/failure.dart';
import '../../data/models/quiz_history_model.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<QuizHistoryModel>>> restoreQuizHistory();
  Future<Either<Failure, void>> saveQuizHistory({
    required QuizHistoryModel quizHistoryModel,
  });
}
