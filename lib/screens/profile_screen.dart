import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 234, 217),
        title: const Text(
          'Profile',
          style: TextStyle(fontFamily: 'LexendGiga'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage('https://i.ibb.co/4fnRbMk/Untitled-design.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Name Surname'
              ,
              style: TextStyle(
                fontFamily: 'LexendGiga',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(
                'Reading Now',
                style: TextStyle(
                  fontFamily: 'LexendGiga',
                  color: Colors.black,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, '/reading-now'),
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text(
                'Wishlist',
                style: TextStyle(
                  fontFamily: 'LexendGiga',
                  color: Colors.black,
                ),
              ),
              onTap: () => Navigator.pushNamed(context, '/wishlist'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 234, 217),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontFamily: 'LexendGiga',
                    color: Colors.brown,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}