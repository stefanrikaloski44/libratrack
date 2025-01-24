import 'package:flutter/material.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/book_details_screen.dart';
import 'screens/genre_books_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(const LibraTrackApp());
}

class LibraTrackApp extends StatelessWidget {
  const LibraTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LibraTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: const AuthScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/book-details': (context) => const BookDetailsScreen(),
        '/genre-books': (context) => const GenreBooksScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/search': (context) => const SearchScreen(),
      },
    );
  }
}