import 'dart:convert';
import 'package:http/http.dart' as http;

class Book {
  final String title;
  final String author;
  final String coverUrl;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'];
    return Book(
      title: volumeInfo['title'] ?? 'Unknown Title',
      author: (volumeInfo['authors'] as List?)?.first ?? 'Unknown Author',
      coverUrl: volumeInfo['imageLinks']?['thumbnail']?.replaceFirst('http:', 'https:') ??
          'https://via.placeholder.com/400x600?text=No+Cover',
      description: volumeInfo['description'] ?? 'No description available',
    );
  }
}

class ApiService {
  static const String baseUrl = 'https://www.googleapis.com/books/v1';

  Future<List<Book>> searchBooks(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/volumes?q=$query&maxResults=20'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final items = data['items'] as List?;
      return items?.map((item) => Book.fromJson(item)).toList() ?? [];
    } else {
      throw Exception('Failed to search books');
    }
  }

  Future<List<Book>> getBooksByGenre(String genre) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/volumes?q=subject:"$genre"&maxResults=30&orderBy=relevance'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items = data['items'] as List?;
        if (items == null || items.isEmpty) {
          return [];
        }
        return items.map((item) => Book.fromJson(item)).toList();
      }
    } catch (e) {
      print('Error fetching books: $e');
    }
    return [];
  }

  Future<Book> getBookDetails(String bookId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/volumes/$bookId'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Book.fromJson(data);
    } else {
      throw Exception('Failed to get book details');
    }
  }
}