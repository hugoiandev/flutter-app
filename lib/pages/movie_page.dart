import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviePageState extends State<MoviePage> {
  static const String urlImage = 'https://image.tmdb.org/t/p/w500/';

  Future<void> getMovies() async {
    const String movieKey = String.fromEnvironment('API_MOVIE_KEY');
    const String url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$movieKey&language=pt-BR&page=1';
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    print(jsonDecode(response.body));
  }

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

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  MoviePageState createState() {
    return MoviePageState();
  }
}
