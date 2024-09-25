import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../category/category_model_movie_details.dart';
import '../home/home_details_screen.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.categories});

  final CategoryModelMovieDetails categories;

  Future<void> addToWatchlist() async {
    CollectionReference watchlist = FirebaseFirestore.instance.collection('watchlist');

    await watchlist.add({
      'title': categories.title,
      'year': categories.year,
      'actors': categories.actors,
      'image': categories.image,
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          HomeDetailsScreen.routName,
          arguments: categories,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.yellow),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 6),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Image.asset(
                categories.image,
                width: 140,
                height: 89,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 15),
                    // overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                await addToWatchlist();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to Watchlist')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
