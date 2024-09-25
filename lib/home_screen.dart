import 'package:flutter/material.dart';
import 'package:movieapp/tabs/browse/browse_tap.dart';
import 'package:movieapp/tabs/home/home_tap.dart';
import 'package:movieapp/tabs/search/view/screens/search_screen.dart';
import 'package:movieapp/tabs/watchlist/watch_list_tap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> taps = [
    const HomeTap(),
    const SearchTap(),
      BrowseTab(),
     WatchListTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 32,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/icon material-movie.png'),
              size: 32,
            ),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/icon ionic-md-bookmarks.png'),
              size: 32,
            ),
            label: 'Watch List',
          ),
        ],
      ),
    );
  }
}
