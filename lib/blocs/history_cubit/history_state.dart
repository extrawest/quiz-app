import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/failure.dart';
import '../../../data/models/quiz_history_model.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    required List<QuizHistoryModel> history,
    required bool isLoading,
    required Failure? failure,
  }) = _HistoryState;

  factory HistoryState.initial() => const HistoryState(
        history: [],
        failure: null,
        isLoading: false,
      );
}
