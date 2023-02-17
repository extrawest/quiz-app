import 'package:fpdart/fpdart.dart';
import 'package:quiz_app/domain/model/quiz_type.dart';

import '../../domain/model/failure.dart';
import '../../domain/model/quiz_model.dart';

abstract class QuizRepository {
  Future<Either<Failure, List<QuizModel>>> retrieveQuizesForType({
    required QuizType quizeType,
  });
}
