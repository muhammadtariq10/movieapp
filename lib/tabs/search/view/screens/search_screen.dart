import 'package:flutter/material.dart';
import 'package:movieapp/tabs/search/view/widgets/search_text_field.dart';
import 'package:movieapp/tabs/search/view/widgets/searched_movie_list.dart';

class SearchTap extends StatefulWidget {
  const SearchTap({super.key});

  @override
  State<SearchTap> createState() => _SearchTapState();
}

class _SearchTapState extends State<SearchTap> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchTextField(
            controller: searchController,
            onChanged: (value) {
              searchController.text = value;
              setState(() {});
            },
          ),
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
        ),
        body: SearchMoviesList(
          query: searchController.text,
        )
        // SizedBox(
        //   width: double.infinity,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Image.asset('assets/images/Icon material-local-movies.png'),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       Text(
        //         'No movies found',
        //         style: Theme.of(context).textTheme.titleSmall?.copyWith(
        //               color: AppTheme.white.withOpacity(.6),
        //             ),
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
