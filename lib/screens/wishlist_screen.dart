import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import '../widgets/bottom_nav_bar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 234, 217),
        title: const Text('Wishlist'),
      ),
      body: Consumer<BookProvider>(
        builder: (context, bookProvider, child) {
          final wishlist = bookProvider.wishlist;

          if (wishlist.isEmpty) {
            return const Center(
              child: Text(
                'Your wishlist seems empty!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: wishlist.length,
            itemBuilder: (context, index) {
              final book = wishlist[index];
              return ListTile(
                leading: Image.network(
                  book.coverUrl,
                  width: 50,
                  height: 75,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  book.title,
                  style: const TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  book.author,
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => bookProvider.removeFromWishlist(book),
                ),
                onTap: () => Navigator.pushNamed(
                  context,
                  '/book-details',
                  arguments: book,
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}