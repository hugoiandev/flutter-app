import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:multi_info_app/models/weather_model.dart';

class HomePageState extends State<HomePage> {
  String inputText = "Hortolândia";
  bool isLoading = false;
  Weather? weatherData;

  Future<void> getWeather() async {
    const weatherKey = String.fromEnvironment('API_WEATHER_KEY');
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$inputText&appid=$weatherKey&lang=pt_br&units=metric';
    final uri = Uri.parse(url);

    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.get(uri);

      setState(() {
        weatherData = Weather.fromJson(jsonDecode(response.body));
      });
    } catch (error) {
      throw Exception('Ocorreu um erro!');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clima')),
      body: Container(
        color: const Color.fromARGB(255, 235, 223, 184),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text('Cidade'),
                      hintText: 'Digite uma cidade',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Icon(Icons.search_rounded),
                )
              ]),
              const SizedBox(height: 30.0),
              Column(
                children: [
                  Text(
                    '${weatherData?.main.temp.toInt()}ºC',
                    style: const TextStyle(fontSize: 50.0),
                  ),
                  Text(
                    '${weatherData?.name}',
                    style: const TextStyle(fontSize: 40.0),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 0.0),
                  child: LayoutBuilder(
                    builder: ((context, constraints) {
                      return SizedBox(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        child: Column(
                          children: [
                            Container(
                              height: constraints.maxHeight * .5,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0)),
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(
                                      color: Colors.white, width: 0),
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Divider(color: Colors.white, height: 0),
                            Container(
                              height: constraints.maxHeight * .5,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(10.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0)),
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(
                                      color: Colors.white, width: 0),
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() {
    return HomePageState();
  }
}
