import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';

import '../../data/models/failure.dart';
import '../../data/models/quiz_history_model.dart';
import 'history_repository.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  HistoryRepositoryImpl({
    required Box<QuizHistoryModel> box,
  }) : _box = box;

  final Box<QuizHistoryModel> _box;

  @override
  Future<Either<Failure, List<QuizHistoryModel>>> restoreQuizHistory() async {
    try {
      final quizHistory = _box.keys.map(_box.get).whereNotNull().toList();
      return Right(quizHistory);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveQuizHistory({
    required QuizHistoryModel quizHistoryModel,
  }) async {
    try {
      final quizHistory = _box.put(quizHistoryModel.key, quizHistoryModel);
      return Right(quizHistory);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
