import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/data/repository/history_repository.dart';
import 'package:quiz_app/presentation/history/cubit/history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit({required HistoryRepository historyRepository})
      : _historyRepository = historyRepository,
        super(HistoryState.initial());

  final HistoryRepository _historyRepository;

  Future<void> loadHistory() async {
    emit(state.copyWith(isLoading: true));
    final historyResult = await _historyRepository.restoreQuizHistory();
    emit(
      historyResult.match(
        (failure) => state.copyWith(failure: failure),
        (history) => state.copyWith(history: history),
      ),
    );
    emit(state.copyWith(isLoading: false));
  }
}
