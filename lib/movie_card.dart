import 'package:flutter/material.dart';
import 'package:movieapp/app_theme.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final double rating;
  final String imageName;

  const MovieCard({
    super.key,
    required this.title,
    required this.rating,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Color(0xFF343534),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            width: 250,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imageName,
                  height: MediaQuery.of(context).size.height * 0.16,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppTheme.gold,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '2019  PG-13  2h 7m',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
