import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../category/category_model_movie_details.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.categories});

  final CategoryModelMovieDetails categories;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  child: Image.asset(
                    categories.image,
                    width: 140,
                    height: 89,
                  )),
              const SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 15,
                        ),
                  ),
                  Text(
                    categories.year,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppTheme.white.withOpacity(.5),
                        ),
                  ),
                  Text(
                    categories.actors,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppTheme.white.withOpacity(.5),
                        ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
