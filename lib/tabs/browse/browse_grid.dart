import 'package:flutter/material.dart';
import 'package:movieapp/tabs/browse/category_grid_item.dart';
import 'package:movieapp/tabs/browse/category_model.dart';
import 'package:movieapp/tabs/browse/movie_details.dart';

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
                builder: (context) => MovieDetails(
                  movieName: categories[index].name,
                ),
              ),
            );
          },
          child: CategoryGridItem(
            category: categories[index],
          ),
        ),
      ),
    );
  }
}
