import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movieapp/tabs/home/home_details_screen.dart';
import '../../app_theme.dart';
import 'Popular.dart';
import 'package:http/http.dart' as http;

import 'Recommended.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  static const String routeName = 'hometap';

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  late ResultsPopular resultsPopular;
  late ResultsPopular resultsReal;
  late ResultsRecommended resultsRecommended;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final popularResponse = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=efe609b0bdfb6ffffe19516c5d3bb2b6'),
      );
      final upcomingResponse = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/upcoming?api_key=efe609b0bdfb6ffffe19516c5d3bb2b6'),
      );

      if (popularResponse.statusCode == 200 &&
          upcomingResponse.statusCode == 200) {
        final popularData = json.decode(popularResponse.body);
        final upcomingData = json.decode(upcomingResponse.body);

        setState(() {
          resultsPopular = ResultsPopular.fromJson(popularData['results'][0]);
          resultsReal = ResultsPopular.fromJson(
              upcomingData['results'][0]); // Use appropriate class
          resultsRecommended =
              ResultsRecommended.fromJson(popularData['results'][1]);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      // Optionally handle the error
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
                    Image.network(
                      resultsPopular.backdropPath != null &&
                              resultsPopular.backdropPath!.isEmpty
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
                            child: InkWell(
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
                                  '${resultsPopular.releaseDate.isNotEmpty ? resultsPopular.releaseDate : 'N/A'} ${resultsPopular.voteAverage != null ? '${resultsPopular.voteAverage}/10' : ''}',
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
                    Positioned(
                      top: 100,
                      left: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
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
                    itemCount: resultsReal.posterPath != null &&
                            resultsReal.posterPath!.isNotEmpty
                        ? 1
                        : 0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            HomeDetailsScreen.routName,
                            arguments: resultsReal.id,
                          );
                        },
                        child: Image.network(
                          resultsReal.posterPath != null &&
                                  resultsReal.posterPath!.isNotEmpty
                              ? 'https://image.tmdb.org/t/p/w500${resultsReal.posterPath}'
                              : 'https://via.placeholder.com/100x150',
                        ),
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
                    itemCount: resultsRecommended.posterPath != null &&
                            resultsRecommended.posterPath!.isNotEmpty
                        ? 1
                        : 0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            HomeDetailsScreen.routName,
                            arguments: resultsRecommended.id,
                          );
                        },
                        child: Image.network(
                          resultsRecommended.posterPath != null &&
                                  resultsRecommended.posterPath!.isNotEmpty
                              ? 'https://image.tmdb.org/t/p/w500${resultsRecommended.posterPath}'
                              : 'https://via.placeholder.com/100x150',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
