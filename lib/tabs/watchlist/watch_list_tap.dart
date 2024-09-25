// import 'package:flutter/material.dart';
// import 'package:movieapp/app_theme.dart';
// import 'package:movieapp/tabs/watchlist/movie_item.dart';
//
// import '../category/category_model_movie_details.dart';
//
// class WatchListTap extends StatelessWidget {
//   WatchListTap({super.key});
//
//   final List<CategoryModelMovieDetails> categories = List.generate(
//     10,
//     (index) => CategoryModelMovieDetails(
//       image: 'assets/images/action.png',
//       title: 'Alita Battle Angel',
//       year: '2019',
//       actors: 'Rosa Salazar, Christoph Waltz',
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Watchlist'),
//         backgroundColor: AppTheme.black,
//       ),
//       body: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (_, index) => MovieItem(
//           categories: categories[index],
//         ),
//         itemCount: categories.length,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../app_theme.dart';
import '../category/category_model_movie_details.dart';
import 'movie_item.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
        backgroundColor: AppTheme.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('watchlist').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final watchlistMovies = snapshot.data?.docs ?? [];

          if (watchlistMovies.isEmpty) {
            return const Center(child: Text('No movies in the watchlist.'));
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: watchlistMovies.length,
            itemBuilder: (context, index) {
              var movie = watchlistMovies[index];


              var movieDetails = CategoryModelMovieDetails(
                image: movie['image'],
                title: movie['title'],
                year: movie['year'],
                actors: movie['actors'],
              );


              return MovieItem(categories: movieDetails);
            },
          );
        },
      ),
    );
  }
}
