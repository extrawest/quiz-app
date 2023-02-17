import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../configuratuon/api_configuration.dart';
import '../models/boolean_quiz.dart';
import '../models/multi_options_quiz.dart';

part 'mocky_api_client.g.dart';

@RestApi(baseUrl: ApiConfiguration.baseUrl)
abstract class MockyApiClient {
  factory MockyApiClient(Dio dio) = _MockyApiClient;

  @GET('5d4b54e3-7172-43d0-b924-fe5d51707e8f')
  Future<List<BooleanQuiz>> getBooleanQuizes();

  @GET('0aeb7418-0c94-41ce-8f5b-09889cf37a58')
  Future<List<MultiOptionsQuiz>> getMultiOptionsQuizes();
}
