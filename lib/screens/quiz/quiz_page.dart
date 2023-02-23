import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/quiz_cubit/quiz_cubit.dart';
import '../../blocs/quiz_cubit/quiz_state.dart';
import '../../data/models/quiz_type.dart';
import 'widget/quiz.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({
    super.key,
    @PathParam('quizType') required this.quizType,
  });

  final String quizType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(
        quizRepository: context.read(),
        historyRepository: context.read(),
        quizType: QuizType.fromString(quizType),
      ),
      child: const _QuizScreen(),
    );
  }
}

class _QuizScreen extends StatefulWidget {
  const _QuizScreen();

  @override
  State<_QuizScreen> createState() => __QuizScreenState();
}

class __QuizScreenState extends State<_QuizScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuizCubit>().loadQuizes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<QuizCubit>().quizType.displayName()),
      ),
      body: SafeArea(
        child: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final quiz = state.currentQuiz;
            if (quiz == null) {
              return const Center(child: Text('You passed all quizes!'));
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: SizedBox(
                  child: QuizWidget(
                    key: ValueKey(quiz.question),
                    quizModel: quiz,
                    onAnswer: (answer) =>
                        context.read<QuizCubit>().passQuiz(answer: answer),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
