import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../services/api_service.dart';

class BookRow extends StatefulWidget {
  final String genre;

  const BookRow({super.key, required this.genre});

  @override
  State<BookRow> createState() => _BookRowState();
}

class _BookRowState extends State<BookRow> {
  final ApiService _apiService = ApiService();
  List<Book>? _books;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    try {
      final books = await _apiService.getBooksByGenre(widget.genre);
      if (mounted) {
        setState(() {
          _books = books;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              '/genre-books',
              arguments: widget.genre,
            ),
            child: Text(
              widget.genre,
              style: const TextStyle(
                fontFamily: 'LexendGiga',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _books == null || _books!.isEmpty
              ? const Center(
            child: Text(
              'No books found',
              style: TextStyle(
                fontFamily: 'LexendGiga',
                color: Colors.black,
              ),
            ),
          )
              : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _books!.length,
            itemBuilder: (context, index) {
              final book = _books![index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  '/book-details',
                  arguments: book,
                ),
                child: Container(
                  width: 130,
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(book.coverUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}