import 'package:flutter/material.dart';
import 'package:movieapp/tabs/browse/details_of_movie.dart';

import '../category/category_grid.dart';
import '../category/category_model.dart';

class BrowseGrid extends StatelessWidget {
  const BrowseGrid({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 158 / 90,
          crossAxisSpacing: 38,
          mainAxisSpacing: 47,
        ),
        itemCount: categories.length,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsOfMovie(
                  movieName: categories[index].name,
                ),
              ),
            );
          },
          child: CategoryGrid(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}
