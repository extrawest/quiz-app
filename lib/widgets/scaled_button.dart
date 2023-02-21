import 'package:flutter/material.dart';

class ScaledButton extends StatefulWidget {
  const ScaledButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  State<ScaledButton> createState() => _ScaledButtonState();
}

class _ScaledButtonState extends State<ScaledButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0.9,
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
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
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
        child: widget.child,
      ),
    );
  }
}
