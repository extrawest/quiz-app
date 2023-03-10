import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../../data/dto/boolean_quiz_dto.dart';
import '../../data/dto/multi_options_quiz_dto.dart';

import '../../data/mappers/mapper.dart';
import '../../data/models/failure.dart';
import '../../data/models/quiz_model.dart';
import '../../data/models/quiz_type.dart';
import '../api/mocky_api_client.dart';
import 'quiz_repository.dart';

class QuizRepositoryImpl extends QuizRepository {
  final MockyApiClient _apiClient;

  final Mapper<BooleanQuizDTO, QuizModel> _booleanQuizMapper;
  final Mapper<MultiOptionsQuizDTO, QuizModel> _multiOptionsQuizMapper;

  QuizRepositoryImpl({
    required MockyApiClient apiClient,
    required Mapper<BooleanQuizDTO, QuizModel> booleanQuizMapper,
    required Mapper<MultiOptionsQuizDTO, QuizModel> multiOptionsQuizMapper,
  })  : _apiClient = apiClient,
        _booleanQuizMapper = booleanQuizMapper,
        _multiOptionsQuizMapper = multiOptionsQuizMapper;

  @override
  Future<Either<Failure, List<QuizModel>>> retrieveQuizesForType({
    required QuizType quizeType,
  }) async {
    try {
      final quizes = await _retreiveQuizesForType(quizeType);
      return Right(quizes);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<List<QuizModel>> _retreiveQuizesForType(QuizType quizeType) async {
    switch (quizeType) {
      case QuizType.boolean:
        return await _retrieveBooleanQuizes();
      case QuizType.multiOptions:
        return await _retrieveMultiOptionsQuizes();
    }
  }

  Future<List<QuizModel>> _retrieveBooleanQuizes() async {
    final quizes = await _apiClient.getBooleanQuizes();
    return quizes.map(_booleanQuizMapper.apply).toList();
  }

  Future<List<QuizModel>> _retrieveMultiOptionsQuizes() async {
    final quizes = await _apiClient.getMultiOptionsQuizes();
    return quizes.map(_multiOptionsQuizMapper.apply).toList();
  }
}
