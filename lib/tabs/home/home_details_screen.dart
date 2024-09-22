import 'package:flutter/material.dart';
import 'package:movieapp/app_theme.dart';
import 'package:movieapp/movie_card.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});
  static const String routeName = 'homedetailsscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dora and the lost city of gold'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/imagetest.png',
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dora and the lost city of gold',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '2019  PG-13  2h 7m',
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
                      'assets/images/background.png',
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * 0.22,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10),
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
                                    color: AppTheme.primary,
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
                            'Having spent most of e\n Dora for her most\n dangerous adventure yet — high\n school',
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
                                '7.7',
                                style: Theme.of(context).textTheme.titleLarge,
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
            color: AppTheme.graysecond,
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
      ),
    );
  }
}
