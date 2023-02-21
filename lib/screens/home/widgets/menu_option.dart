import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/scaled_button.dart';

class MenuOption extends StatelessWidget {
  const MenuOption({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ScaledButton(
      onPressed: onPressed,
      builder: (context, _) => Container(
        height: 150,
        alignment: Alignment.center,
        // padding: const EdgeInsets.all(64),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey,
            ),
          ],
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
