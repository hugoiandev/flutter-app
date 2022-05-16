import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filmes')),
      body: Column(
        children: const [Text('Page movies')],
      ),
    );
  }
}
