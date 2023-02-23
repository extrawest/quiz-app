import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/screens/history/widgets/quiz_history_tile.dart';

import '../../blocs/history_cubit/history_cubit.dart';
import '../../blocs/history_cubit/history_state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit(historyRepository: context.read()),
      child: const _HistoryScreen(),
    );
  }
}

class _HistoryScreen extends StatefulWidget {
  const _HistoryScreen();

  @override
  State<_HistoryScreen> createState() => __HistoryScreenState();
}

class __HistoryScreenState extends State<_HistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryCubit>().loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
        ),
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.history.isEmpty) {
            return const Center(child: Text('History is empty'));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: ListView(
              children: state.history
                  .map(
                    (historyItem) => QuizHistoryTile(
                      onPressed: () {},
                      historyItem: historyItem,
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
