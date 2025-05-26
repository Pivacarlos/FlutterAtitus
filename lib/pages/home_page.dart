import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/frase_card.dart';
import '../widgets/botao_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String frase = 'Clique no botão para ver uma frase.';
  bool carregando = false;

  Future<void> buscarFrase() async {
    setState(() => carregando = true);

    final resposta = await http.get(
      Uri.parse('https://api.api-ninjas.com/v1/quotes'),
      headers: {'X-Api-Key': 'ormo4vCwluIB/uYSRkWE4Q==S9tgf6XmgWElE0Vt'},
    );

    if (!mounted) return;

    if (resposta.statusCode == 200) {
      final dados = json.decode(resposta.body);
      setState(() {
        frase = dados[0]['quote'];
        carregando = false;
      });
    } else {
      setState(() {
        frase = "Erro ao buscar frase.";
        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Frase do Dia')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: carregando
              ? const CircularProgressIndicator()
              : FraseCard(texto: frase),
        ),
      ),
      floatingActionButton: BotaoRefresh(onPressed: buscarFrase),
    );
  }
}
