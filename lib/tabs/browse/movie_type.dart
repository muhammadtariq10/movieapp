import 'package:flutter/material.dart';

import '../../models/MoviesResponse.dart';

class MovieType extends StatelessWidget {
  Genres categories;

  MovieType({required this.categories, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.asset(
                categories.imagePath ?? 'assets/images/Mystery.jpg',
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Center(
            child: Text(
              categories.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
