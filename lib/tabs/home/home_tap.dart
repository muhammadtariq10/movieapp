import 'package:flutter/material.dart';
import 'package:movieapp/tabs/home/home_details_screen.dart';
import '../../api/api_service.dart';
import '../../app_theme.dart';
import 'Popular.dart';
import 'Recommended.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  static const String routeName = 'hometap';

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  late ResultsPopular resultsPopular;
  List<ResultsPopular> resultsReal = [];
  List<ResultsRecommended> resultsRecommended = [];
  bool isLoading = true;

  Set<int> favoriteNewReleases = {};
  Set<int> favoriteRecommended = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final moviesData = await APIService.fetchMovies();

      setState(() {
        resultsPopular = ResultsPopular.fromJson(moviesData['popular'][0]);
        resultsReal = (moviesData['upcoming'] as List<dynamic>)
            .map((v) => ResultsPopular.fromJson(v))
            .toList();
        resultsRecommended = (moviesData['popular'] as List<dynamic>)
            .map((v) => ResultsRecommended.fromJson(v))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          HomeDetailsScreen.routName,
                          arguments: resultsPopular.id,
                        );
                      },
                      child: Image.network(
                        resultsPopular.backdropPath != null &&
                                resultsPopular.backdropPath!.isNotEmpty
                            ? 'https://image.tmdb.org/t/p/w500${resultsPopular.backdropPath}'
                            : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWz9tftw9qculFH1gxieWkxL6rbRk_hrXTSg&s',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey,
                            child: const Center(child: Icon(Icons.error)),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.2),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 10,
                      right: 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  HomeDetailsScreen.routName,
                                  arguments: resultsPopular.id,
                                );
                              },
                              child: Image.network(
                                resultsPopular.posterPath != null &&
                                        resultsPopular.posterPath!.isNotEmpty
                                    ? 'https://image.tmdb.org/t/p/w500${resultsPopular.posterPath}'
                                    : 'https://via.placeholder.com/100x150',
                                width: 100,
                                height: 150,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey,
                                    child:
                                        const Center(child: Icon(Icons.error)),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  resultsPopular.title.isNotEmpty
                                      ? resultsPopular.title
                                      : 'Title Not Available',
                                  style: Theme.of(context).textTheme.titleLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${resultsPopular.releaseDate.isNotEmpty ? resultsPopular.releaseDate : 'Data Not Available'} ${resultsPopular.voteAverage != null ? '${resultsPopular.voteAverage}/10' : ''}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'New Releases',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Container(
                  color: AppTheme.graySecond,
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: resultsReal.length,
                    itemBuilder: (context, index) {
                      final isFavorite = favoriteNewReleases.contains(index);
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                HomeDetailsScreen.routName,
                                arguments: resultsReal[index].id,
                              );
                            },
                            child: Image.network(
                              resultsReal[index].posterPath != null &&
                                      resultsReal[index].posterPath!.isNotEmpty
                                  ? 'https://image.tmdb.org/t/p/w500${resultsReal[index].posterPath}'
                                  : 'https://via.placeholder.com/100x150',
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (isFavorite) {
                                    favoriteNewReleases.remove(index);
                                  } else {
                                    favoriteNewReleases.add(index);
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Recommended',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Container(
                  height: 200,
                  color: AppTheme.graySecond,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: resultsRecommended.length,
                    itemBuilder: (context, index) {
                      final isFavorite = favoriteRecommended.contains(index);
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                HomeDetailsScreen.routName,
                                arguments: resultsRecommended[index].id,
                              );
                            },
                            child: Image.network(
                              resultsRecommended[index].posterPath != null &&
                                      resultsRecommended[index]
                                          .posterPath!
                                          .isNotEmpty
                                  ? 'https://image.tmdb.org/t/p/w500${resultsRecommended[index].posterPath}'
                                  : 'https://via.placeholder.com/100x150',
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (isFavorite) {
                                    favoriteRecommended.remove(index);
                                  } else {
                                    favoriteRecommended.add(index);
                                  }
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
