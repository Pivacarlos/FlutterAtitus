import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FraseCard extends StatelessWidget {
  final String texto;

  const FraseCard({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          texto,
          style: const TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: texto));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Frase copiada!')),
            );
          },
          icon: const Icon(Icons.copy),
          label: const Text("Copiar Frase"),
        ),
      ],
    );
  }
}
