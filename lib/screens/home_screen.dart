import 'package:flutter/material.dart';
import '../widgets/book_row.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('LibraTrack'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, '/search'),
          ),
        ],
      ),
      body: ListView(
        children: const [
          BookRow(genre: 'Fantasy'),
          BookRow(genre: 'Science Fiction'),
          BookRow(genre: 'Mystery'),
          BookRow(genre: 'Romance'),
          BookRow(genre: 'Horror'),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}