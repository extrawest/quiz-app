import 'package:fpdart/fpdart.dart';

import '../models/boolean_quiz.dart';
import '../models/failure.dart';
import '../models/multi_options_quiz.dart';

abstract class QuizRepository {
  Future<Either<Failure, List<MultiOptionsQuiz>>> retrieveMultiOptionsQuizes();
  Future<Either<Failure, List<BooleanQuiz>>> retrieveBooleanQuizes();
}
