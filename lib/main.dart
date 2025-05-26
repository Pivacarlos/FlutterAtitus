import 'package:flutter/material.dart';
import 'package:frase_do_dia/pages/home_page.dart';
void main() => runApp(const FraseApp());

class FraseApp extends StatelessWidget {
  const FraseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frase do Dia',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomePage(),
    );
  }
}
