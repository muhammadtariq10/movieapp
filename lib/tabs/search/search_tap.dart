import 'package:flutter/material.dart';
import 'package:movieapp/app_theme.dart';
import 'package:movieapp/tabs/search/search_text_field.dart';

class SearchTap extends StatelessWidget {
  const SearchTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchTextField(),
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Icon material-local-movies.png'),
            const SizedBox(
              height: 10,
            ),
            Text(
              'No movies found',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppTheme.white.withOpacity(.6),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
