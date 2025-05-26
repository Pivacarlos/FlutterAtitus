import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima Agora',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Map<String, dynamic>? weatherData;
  final String city = 'Porto Alegre';
  final String apiKey = '5f55633c3e955e3b15d1755db89dbf55'; // substitua pela sua chave

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=pt_br',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        weatherData = json.decode(response.body);
      });
    } else {
      debugPrint('Erro ao buscar clima: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clima em $city')),
      body: weatherData == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weatherData!['main']['temp']}°C',
                    style: const TextStyle(fontSize: 48),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    weatherData!['weather'][0]['description'],
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Image.network(
                    'https://openweathermap.org/img/wn/${weatherData!['weather'][0]['icon']}@2x.png',
                  ),
                ],
              ),
            ),
    );
  }
}
