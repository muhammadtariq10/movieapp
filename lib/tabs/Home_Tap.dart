import 'package:flutter/material.dart';

import '../../app_theme.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});
  static const String routName = 'hometap';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/imagetest.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
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
                      child: Image.asset(
                        'assets/images/imagetesting.png',
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16), // Adjusted spacing
                    // Use Expanded or Flexible to avoid overflow
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dora and the lost city of gold',
                            style: Theme.of(context).textTheme.titleLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),
                          Text(
                              '2019 PG-13 2h 7m',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14)),

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
                  child: const Icon(
                    Icons.play_circle,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                'New Releases',
                style: Theme.of(context).textTheme.titleLarge),
          ),

          Container(
            color: AppTheme.graysecond,
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.asset('assets/images/nagros.png'),
                Image.asset('assets/images/spiderman.png'),
                Image.asset('assets/images/Annabelle.png'),
                Image.asset('assets/images/toyStory.png'),
              ],
            ),
          ),
          // Recommended section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    'Recommended',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Container(
                height: 200,
                color: AppTheme.graysecond,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/images/spiderman.png'),
                    Image.asset('assets/images/spiderman.png'),
                    Image.asset('assets/images/spiderman.png'),
                    Image.asset('assets/images/spiderman.png'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}