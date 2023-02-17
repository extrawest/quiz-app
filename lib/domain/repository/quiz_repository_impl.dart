import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quiz_app/data/api/mocky_api_client.dart';
import 'package:quiz_app/data/dto/boolean_quiz_dto.dart';
import 'package:quiz_app/data/dto/multi_options_quiz_dto.dart';
import 'package:quiz_app/data/mapper/mapper.dart';

import '../../data/repository/quiz_repository.dart';
import '../../domain/model/failure.dart';
import '../../domain/model/quiz_model.dart';
import '../../domain/model/quiz_type.dart';

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
    } on DioError catch (error) {
      return Left(Failure(message: error.message ?? ''));
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
