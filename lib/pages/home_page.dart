import 'package:flutter/material.dart';
import 'package:multi_info_app/controllers/location.dart';
import 'package:multi_info_app/controllers/weather_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 134, 160, 168),
      appBar: AppBar(
        title: const Text('Clima'),
      ),
      body: Consumer<WeatherController>(builder: (context, weather, child) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      Provider.of<WeatherController>(context, listen: false)
                          .setText(text);
                    },
                    decoration: const InputDecoration(
                      label: Text('Cidade'),
                      hintText: 'Digite uma cidade',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<WeatherController>(context, listen: false)
                        .getWeather();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Icon(Icons.search_rounded),
                )
              ]),
              const SizedBox(height: 30.0),
              weather.isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        Text(
                          '${weather.weatherData?.main.temp.toInt()}ºC',
                          style: const TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${weather.weatherData?.name}',
                          style: const TextStyle(
                              fontSize: 40.0, color: Colors.white),
                        )
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
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10.0),
                                  bottom: Radius.circular(10.0),
                                ),
                                color: Colors.blueGrey,
                              ),
                              child: weather.isLoading
                                  ? Column(
                                      children: [
                                        Container(
                                          height: constraints.maxHeight,
                                          width: constraints.maxWidth,
                                          alignment: Alignment.center,
                                          child:
                                              const CircularProgressIndicator(),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Image(
                                          image: NetworkImage(
                                              'http://openweathermap.org/img/wn/${weather.weatherData?.weather[0].icon}@4x.png'),
                                        ),
                                        Text(
                                          '${weather.weatherData?.weather[0].description.toUpperCase()}',
                                          style: const TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
