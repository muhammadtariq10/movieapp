import 'package:flutter/material.dart';

import '../../app_theme.dart';
import 'category_model_movie_details.dart';

class CategoryGridMovieDetails extends StatelessWidget {
  CategoryGridMovieDetails({super.key, required this.categories});

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
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: Image.asset(
                    categories.image,
                  )),
              SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    categories.year,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    categories.actors,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            color: AppTheme.lava,
            height: 4,
          )
        ],
      ),
    );
  }
}
