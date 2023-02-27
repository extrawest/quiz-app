import 'package:fpdart/fpdart.dart';

import '../../data/models/failure.dart';
import '../../data/models/quiz_model.dart';
import '../../data/models/quiz_type.dart';

abstract class QuizRepository {
  Future<Either<Failure, List<QuizModel>>> retrieveQuizesForType({
    required QuizType quizeType,
  });
}
