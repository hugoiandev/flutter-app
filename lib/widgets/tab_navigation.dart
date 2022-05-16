import 'package:flutter/material.dart';
import 'package:multi_info_app/pages/crypto_page.dart';
import 'package:multi_info_app/pages/home_page.dart';
import 'package:multi_info_app/pages/movie_page.dart';

class TabNavigationState extends State<TabNavigation> {
  int _currentTabIndex = 0;

  List<Widget> tabPages = const [
    HomePage(),
    MoviePage(),
    CryptoPage(),
  ];

  void _changeIndex(index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
