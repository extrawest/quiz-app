import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../data/models/quiz_type.dart';
import '../../router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.pushRoute(
                QuizRoute(
                  quizType: QuizType.boolean.toString(),
                ),
              ),
              child: const Text('True-False quiz'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.pushRoute(
                QuizRoute(
                  quizType: QuizType.multiOptions.toString(),
                ),
              ),
              child: const Text('Multiple options quiz'),
            )
          ],
        ),
      ),
    );
  }
}
