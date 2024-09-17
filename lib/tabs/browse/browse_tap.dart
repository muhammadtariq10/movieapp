import 'package:flutter/material.dart';
import 'package:movieapp/tabs/browse/browse_grid.dart';
import 'category_model.dart';

class BrowseTab extends StatelessWidget {
  BrowseTab({super.key});

  static const routeName = 'browse';

  final List<CategoryModel> categories = List.generate(
    20,
    (index) => CategoryModel(
      name: 'Action Movie $index',
      image: 'assets/images/action.png',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Browse Category ',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 22,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            BrowseGrid(categories: categories),
          ],
        ),
      ),
    );
  }
}
