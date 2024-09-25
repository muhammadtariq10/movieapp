import 'package:flutter/material.dart';
import 'package:movieapp/shared/app_theme.dart';
import 'package:movieapp/tabs/search/data/models/movie.dart';

class MovieItemSearch extends StatelessWidget {
  const MovieItemSearch({super.key, required this.movie});
  final Movie movie;
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
                  child: Image.network(
                    movie.posterPath ?? 'https://www.google.com/images/branding/googlelogo/1x/googlelogo_light_color_272x92dp.png',
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
                    movie.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 15,
                        ),
                  ),
                  Text(
                    movie.releaseDate,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppTheme.white.withOpacity(.5),
                        ),
                  ),
                  Text(
                    movie.overview,
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
