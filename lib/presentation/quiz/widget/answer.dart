import 'package:flutter/material.dart';

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
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

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

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.easeOut,
      ),
    );
  }

  bool isPressed = false;

  @override
  void dispose() {
    _animationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: SlideTransition(
        position: _animation,
        child: GestureDetector(
          onTapDown: (_) {
            _scaleController.forward();
            setState(() {
              isPressed = true;
            });
          },
          onTapUp: (_) {
            _scaleController.reverse();
            setState(() {
              isPressed = false;
            });
            widget.onPressed();
          },
          onTapCancel: () {
            _scaleController.reverse();
            setState(() {
              isPressed = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isPressed ? Colors.blue : Colors.white,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text(
                widget.answer,
                style: TextStyle(
                  fontSize: 20,
                  color: isPressed ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
