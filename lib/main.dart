import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/app_theme.dart';
import 'package:movieapp/home_screen.dart';
import 'package:movieapp/tabs/home/home_details_screen.dart';
import 'package:movieapp/tabs/home/home_tap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: "AIzaSyCO0b5we6ZPFrCjfceHKTMMZkIJwdsxEWI",
    appId: "1:292182059763:android:9e0e760c5699418ebf2586",
    messagingSenderId: "292182059763",
    projectId: "movieApp-55406",));
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routName: (_) => const HomeScreen(),
        HomeTap.routeName: (_) => const HomeTap(),
        HomeDetailsScreen.routName: (context) => const HomeDetailsScreen(),
      },
      themeMode: ThemeMode.light,
      theme: AppTheme.lightetheme,
    );
  }
}
