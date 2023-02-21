import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({
    super.key,
    required this.question,
  });
  final String question;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward(from: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animationController,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Center(
          child: Text(
            widget.question,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
