import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import '../widgets/bottom_nav_bar.dart';

class ReadingNowScreen extends StatelessWidget {
  const ReadingNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 234, 217),
        title: const Text('Reading Now'),
      ),
      body: Consumer<BookProvider>(
        builder: (context, bookProvider, child) {
          final readingNow = bookProvider.readingNow;

          if (readingNow.isEmpty) {
            return const Center(
              child: Text(
                'Try adding books that you are currently reading!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: readingNow.length,
            itemBuilder: (context, index) {
              final book = readingNow[index];
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
                  onPressed: () => bookProvider.removeFromReadingNow(book),
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