import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/domain/model/quiz_result_model.dart';

import '../../../domain/model/failure.dart';
import '../../../domain/model/quiz_model.dart';

part 'quiz_state.freezed.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState({
    required List<QuizModel>? quizes,
    required List<QuizResultModel> result,
    required bool isLoading,
    required Failure? failure,
  }) = _QuizState;

  const QuizState._();

  factory QuizState.initial() => const QuizState(
        quizes: null,
        result: [],
        isLoading: false,
        failure: null,
      );

  QuizModel? get currentQuiz => quizes?.lastOrNull;
}
