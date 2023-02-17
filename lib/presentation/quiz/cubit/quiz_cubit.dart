import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/data/repository/history_repository.dart';
import 'package:quiz_app/domain/model/quiz_history_model.dart';

import '../../../data/repository/quiz_repository.dart';
import '../../../domain/model/quiz_type.dart';
import 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit({
    required QuizRepository quizRepository,
    required HistoryRepository historyRepository,
    required this.quizType,
  })  : _quizRepository = quizRepository,
        _historyRepository = historyRepository,
        super(QuizState.initial());

  final QuizRepository _quizRepository;
  final HistoryRepository _historyRepository;

  final QuizType quizType;

  Future<void> loadQuizes() async {
    emit(state.copyWith(isLoading: true));
    final quizesResult = await _quizRepository.retrieveQuizesForType(
      quizeType: quizType,
    );

    emit(
      quizesResult.match(
        (failure) => state.copyWith(failure: failure),
        (quizes) => state.copyWith(quizes: quizes.reversed.toList()),
      ),
    );

    emit(state.copyWith(isLoading: false));
  }

  void passQuiz({
    required String answer,
  }) {
    final quiz = state.currentQuiz;
    final quizes = state.quizes;

    if (quizes == null || quiz == null) {
      return;
    }
    final quizResult = quiz.pass(answer);

    emit(
      state.copyWith(
        result: [...state.result, quizResult],
        quizes: List.of(quizes)..removeLast(),
      ),
    );
  }

  Future<void> completeQuiz() async {
    emit(state.copyWith(isLoading: true));
    final saveHistoryResult = await _historyRepository.saveQuizHistory(
      quizHistoryModel: QuizHistoryModel(
        date: DateTime.now(),
        quizes: state.result,
      ),
    );
    emit(
      saveHistoryResult.match(
        (failure) => state.copyWith(failure: failure),
        (_) => state,
      ),
    );

    emit(state.copyWith(isLoading: false));
  }
}
