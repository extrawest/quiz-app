import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/scaled_button.dart';

class Answer extends StatefulWidget {
  const Answer({
    super.key,
    required this.index,
    required this.answer,
    required this.onPressed,
  });

  final int index;
  final String answer;
  final VoidCallback onPressed;

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  static const duration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: duration,
    );
    _animation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    Future.delayed(
      (const Duration(milliseconds: 100)) * widget.index,
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaledButton(
      onPressed: widget.onPressed,
      child: SlideTransition(
        position: _animation,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 5,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Text(
              widget.answer,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
