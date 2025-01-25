import 'package:flutter/foundation.dart';
import '../models/book_model.dart';

class BookProvider with ChangeNotifier {
  final List<Book> _wishlist = [];
  final List<Book> _readingNow = [];

  List<Book> get wishlist => [..._wishlist];
  List<Book> get readingNow => [..._readingNow];

  void addToWishlist(Book book) {
    if (!_wishlist.contains(book)) {
      _wishlist.add(book);
      notifyListeners();
    }
  }

  void removeFromWishlist(Book book) {
    _wishlist.remove(book);
    notifyListeners();
  }

  void addToReadingNow(Book book) {
    if (!_readingNow.contains(book)) {
      _readingNow.add(book);
      notifyListeners();
    }
  }

  void removeFromReadingNow(Book book) {
    _readingNow.remove(book);
    notifyListeners();
  }

  bool isInWishlist(Book book) {
    return _wishlist.contains(book);
  }

  bool isInReadingNow(Book book) {
    return _readingNow.contains(book);
  }
}