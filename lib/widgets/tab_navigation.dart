import 'package:flutter/material.dart';
import 'package:multi_info_app/controllers/location.dart';
import 'package:multi_info_app/controllers/weather_controller.dart';
import 'package:multi_info_app/pages/crypto_page.dart';
import 'package:multi_info_app/pages/home_page.dart';
import 'package:multi_info_app/pages/movie_page.dart';
import 'package:provider/provider.dart';

class TabNavigationState extends State<TabNavigation> {
  int _currentTabIndex = 0;

  List<Widget> tabPages = [
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          final weather = WeatherController();
          weather.getWeather();
          return weather;
        }),
        ChangeNotifierProvider(create: (_) {
          final location = LocationController();
          location.checkLocation();
          return location;
        }),
      ],
      child: const HomePage(),
    ),
    const MoviePage(),
    const CryptoPage(),
  ];

  void _changeIndex(index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: tabPages.elementAt(_currentTabIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: 'Clima'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_rounded), label: 'Moedas'),
        ],
        currentIndex: _currentTabIndex,
        onTap: _changeIndex,
      ),
    );
  }
}

class TabNavigation extends StatefulWidget {
  const TabNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TabNavigationState();
  }
}
