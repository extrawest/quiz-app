import 'package:fpdart/fpdart.dart';

import '../../data/models/failure.dart';
import '../../data/models/quiz_history_model.dart';
import 'history_repository.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  @override
  Future<Either<Failure, List<QuizHistoryModel>>> restoreQuizHistory() {
    // TODO: implement restoreQuizHistory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveQuizHistory(
      {required QuizHistoryModel quizHistoryModel}) {
    // TODO: implement saveQuizHistory
    throw UnimplementedError();
  }
}
