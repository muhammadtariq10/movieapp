import 'package:flutter/material.dart';
import 'package:movieapp/app_theme.dart';
import 'package:movieapp/tabs/browse/movie_model.dart';
import 'package:movieapp/tabs/watchlist/movie_item.dart';

class WatchListTap extends StatelessWidget {
  WatchListTap({super.key});

  final List<MovieModel> categories = List.generate(
    10,
    (index) => MovieModel(
      image: 'assets/images/action.png',
      title: 'Alita Battle Angel',
      year: '2019',
      actors: 'Rosa Salazar, Christoph Waltz',
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
        backgroundColor: AppTheme.black,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => MovieItem(
          categories: categories[index],
        ),
        itemCount: categories.length,
      ),
    );
  }
}
