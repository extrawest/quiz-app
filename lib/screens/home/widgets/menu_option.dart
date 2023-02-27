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
      child: Container(
        height: 150,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Theme.of(context).shadowColor,
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
