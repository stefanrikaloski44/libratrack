import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/book_details_screen.dart';
import 'screens/genre_books_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';
import 'screens/wishlist_screen.dart';
import 'screens/reading_now_screen.dart';
import 'providers/book_provider.dart';

void main() {
  runApp(const LibraTrackApp());
}

class LibraTrackApp extends StatelessWidget {
  const LibraTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => BookProvider(),
      child: MaterialApp(
        title: 'LibraTrack',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          brightness: Brightness.light,
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontFamily: 'LexendGiga'),
            displayMedium: TextStyle(fontFamily: 'LexendGiga'),
            displaySmall: TextStyle(fontFamily: 'LexendGiga'),
            headlineLarge: TextStyle(fontFamily: 'LexendGiga'),
            headlineMedium: TextStyle(fontFamily: 'LexendGiga'),
            headlineSmall: TextStyle(fontFamily: 'LexendGiga'),
            titleLarge: TextStyle(fontFamily: 'LexendGiga'),
            titleMedium: TextStyle(fontFamily: 'LexendGiga'),
            titleSmall: TextStyle(fontFamily: 'LexendGiga'),
            bodyLarge: TextStyle(fontFamily: 'LexendGiga'),
            bodyMedium: TextStyle(fontFamily: 'LexendGiga'),
            bodySmall: TextStyle(fontFamily: 'LexendGiga'),
            labelLarge: TextStyle(fontFamily: 'LexendGiga'),
            labelMedium: TextStyle(fontFamily: 'LexendGiga'),
            labelSmall: TextStyle(fontFamily: 'LexendGiga'),
          ),
        ),
        home: const AuthScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/book-details': (context) => const BookDetailsScreen(),
          '/genre-books': (context) => const GenreBooksScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/search': (context) => const SearchScreen(),
          '/wishlist': (context) => const WishlistScreen(),
          '/reading-now': (context) => const ReadingNowScreen(),
        },
      ),
    );
  }
}