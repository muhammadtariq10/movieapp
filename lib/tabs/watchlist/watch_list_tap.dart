import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WatchListTap extends StatefulWidget {
  const WatchListTap({super.key});

  @override
  State<WatchListTap> createState() => _WatchListTapState();
}

class _WatchListTapState extends State<WatchListTap> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> removeFromWatchlist(String documentId) async {
    try {
      await firestore.collection('watchlist').doc(documentId).delete();
    } catch (e) {
      print('Error removing movie from watchlist: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('watchlist').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error loading watchlist.'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No movies in watchlist.'));
          }

          final movies = snapshot.data!.docs;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                leading: Image.network(
                  movie['posterPath'] != null && movie['posterPath'].isNotEmpty
                      ? 'https://image.tmdb.org/t/p/w500${movie['posterPath']}'
                      : 'https://via.placeholder.com/100x150',
                ),
                title: Text(
                  movie['title'] ?? 'No title available',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(movie['releaseDate'] ?? 'No date available'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    removeFromWatchlist(movie.id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}