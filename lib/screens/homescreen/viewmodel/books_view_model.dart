import 'package:flutter/material.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/screens/homescreen/model/books_search_model.dart';
import 'package:googe_books_search/screens/homescreen/repository/books_repository.dart';

class BooksViewModel extends ChangeNotifier {
  Future<BookSearchModel> searchBooks(String query) async {
    return await locator.get<BooksRepository>().fetchSearchBooks(query);
  }
}
