import 'package:flutter/material.dart';
import '../widgets/book_row.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 234, 217),

        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
              width: 300,
              height: 300,
              child: Image.network(
                'https://i.ibb.co/L8V2kvs/LIBRATRACK-with-background.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
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
