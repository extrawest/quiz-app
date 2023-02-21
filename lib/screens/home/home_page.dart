import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../data/models/quiz_type.dart';
import '../../router.dart';
import 'widgets/menu_option.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take the quiz!'),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 16),
            icon: const Icon(Icons.history_outlined),
            onPressed: () => {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).copyWith(top: 24),
        child: Row(
          children: [
            Expanded(
              child: MenuOption(
                onPressed: () => context.pushRoute(
                  QuizRoute(
                    quizType: QuizType.boolean.toString(),
                  ),
                ),
                title: 'True-False quiz',
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: MenuOption(
                onPressed: () => context.pushRoute(
                  QuizRoute(
                    quizType: QuizType.multiOptions.toString(),
                  ),
                ),
                title: 'Multiple options quiz',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
