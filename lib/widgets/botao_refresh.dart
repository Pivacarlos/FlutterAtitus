import 'package:flutter/material.dart';

class BotaoRefresh extends StatelessWidget {
  final VoidCallback onPressed;

  const BotaoRefresh({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.refresh),
      tooltip: 'Nova Frase',
    );
  }
}
