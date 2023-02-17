import 'package:fpdart/fpdart.dart';
import '../../data/repository/history_repository.dart';
import '../../domain/model/failure.dart';
import '../../domain/model/quiz_history_model.dart';

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
