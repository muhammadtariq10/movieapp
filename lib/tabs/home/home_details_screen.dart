import 'package:flutter/material.dart';
import 'package:movieapp/api/api_service.dart';
import 'package:movieapp/app_theme.dart';
import 'package:movieapp/tabs/home/movie_card.dart';
import 'package:movieapp/widgets/error%20_indicator.dart';
import 'package:movieapp/widgets/loading_indicator.dart';

class HomeDetailsScreen extends StatefulWidget {
  const HomeDetailsScreen({super.key});
  static const String routName = 'detailsScreen';

  @override
  State<HomeDetailsScreen> createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  int? movieId;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is int) {
      movieId = args;
    }

    print(movieId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detais Screen'),
      ),
      body: FutureBuilder(
        future: APIService.getMovieDetailsRespons(movieId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          } else if (snapshot.hasError) {
            return ErrorIndicator();
          } else {
            final movies = snapshot.data;
            return Column(
              children: [
                Image.asset(
                  'assets/images/background.png',
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movies?.originalTitle ??
                            'Dora and the lost city of gold',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        movies?.releaseDate ?? '',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 10,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/Image.png',
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height * 0.22,
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ActionChip(
                                  backgroundColor: AppTheme.black,
                                  label: Text(
                                    'Action',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.white,
                                        ),
                                  ),
                                  onPressed: () {},
                                  side: const BorderSide(
                                    width: 2,
                                    color: AppTheme.gold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  movies?.overview ?? '',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppTheme.gold,
                                    ),
                                    Text(
                                      movies?.voteAverage.toString() ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppTheme.graySecond,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => const MovieCard(
                      title: 'Deadpool 2',
                      rating: 7.7,
                      imageName: 'assets/images/Image.png',
                    ),
                    itemCount: 10,
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
