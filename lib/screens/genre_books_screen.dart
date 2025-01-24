import 'package:flutter/material.dart';
import '../services/api_service.dart';

class GenreBooksScreen extends StatefulWidget {
  const GenreBooksScreen({super.key});

  @override
  State<GenreBooksScreen> createState() => _GenreBooksScreenState();
}

class _GenreBooksScreenState extends State<GenreBooksScreen> {
  final ApiService _apiService = ApiService();
  List<Book>? _books;
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final genre = ModalRoute.of(context)?.settings.arguments as String?;
    if (genre != null) {
      _loadBooks(genre);
    }
  }

  Future<void> _loadBooks(String genre) async {
    try {
      final books = await _apiService.getBooksByGenre(genre);
      setState(() {
        _books = books;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load books')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ModalRoute.of(context)?.settings.arguments as String? ?? 'Genre Books'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _books == null
              ? const Center(child: Text('Failed to load books'))
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _books!.length,
                  itemBuilder: (context, index) {
                    final book = _books![index];
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/book-details',
                        arguments: book,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(book.coverUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            book.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            book.author,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}