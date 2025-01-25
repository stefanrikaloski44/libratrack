import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book_model.dart';
import '../providers/book_provider.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)?.settings.arguments as Book;
    final bookProvider = Provider.of<BookProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 234, 217),
        title: const Text('Book Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              book.coverUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.author,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    book.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (bookProvider.isInWishlist(book)) {
                            bookProvider.removeFromWishlist(book);
                          } else {
                            bookProvider.addToWishlist(book);
                          }
                        },
                        icon: Icon(
                            bookProvider.isInWishlist(book)
                                ? Icons.bookmark
                                : Icons.bookmark_add
                        ),
                        label: Text(
                            bookProvider.isInWishlist(book)
                                ? 'Remove from Wishlist'
                                : 'Add to Wishlist'
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (bookProvider.isInReadingNow(book)) {
                            bookProvider.removeFromReadingNow(book);
                          } else {
                            bookProvider.addToReadingNow(book);
                          }
                        },
                        icon: Icon(
                            bookProvider.isInReadingNow(book)
                                ? Icons.book
                                : Icons.book_outlined
                        ),
                        label: Text(
                            bookProvider.isInReadingNow(book)
                                ? 'Stop Reading'
                                : 'Reading Now'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}