import 'package:flutter/foundation.dart';

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