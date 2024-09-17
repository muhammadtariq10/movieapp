import 'package:flutter/material.dart';

import '../category/category_grid_movie_details.dart';
import '../category/category_model_movie_details.dart';

class DetailsOfMovie extends StatelessWidget {
  final String movieName;

  DetailsOfMovie({super.key, required this.movieName});

  final List<CategoryModelMovieDetails> categories = List.generate(
    100,
    (index) => CategoryModelMovieDetails(
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
        title: Text(movieName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => CategoryGridMovieDetails(
          categories: categories[index],
        ),
        itemCount: categories.length,
      ),
    );
  }
}
