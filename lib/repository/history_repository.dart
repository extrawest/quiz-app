import 'package:fpdart/fpdart.dart';
import 'package:quiz_app/models/quiz_history.dart';

import '../models/failure.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<QuizHistory>>> restoreQuizHistory();
}
