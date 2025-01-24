import 'package:flutter/material.dart';
import '../services/api_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _searchController = TextEditingController();
  List<Book>? _searchResults;
  bool _isLoading = false;

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final results = await _apiService.searchBooks(query);
      setState(() {
        _searchResults = results;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to search books')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search books, authors, or ISBN...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: const TextStyle(color: Colors.white),
          onSubmitted: _performSearch,
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _searchResults == null
              ? const Center(
                  child: Text('Search for books'),
                )
              : _searchResults!.isEmpty
                  ? const Center(
                      child: Text('No results found'),
                    )
                  : ListView.builder(
                      itemCount: _searchResults!.length,
                      itemBuilder: (context, index) {
                        final book = _searchResults![index];
                        return ListTile(
                          leading: Image.network(
                            book.coverUrl,
                            width: 50,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                          title: Text(book.title),
                          subtitle: Text(book.author),
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/book-details',
                            arguments: book,
                          ),
                        );
                      },
                    ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}