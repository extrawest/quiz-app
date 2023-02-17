import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/domain/model/quiz_type.dart';
import 'package:quiz_app/presentation/quiz/cubit/quiz_cubit.dart';

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
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
