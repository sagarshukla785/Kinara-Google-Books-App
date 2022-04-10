import 'package:flutter/material.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/screens/homescreen/model/books_search_model.dart';
import 'package:googe_books_search/screens/homescreen/repository/books_repository.dart';

class BooksViewModel extends ChangeNotifier {
  BookSearchModel? _bookSearchModel;
  BookSearchModel? get bookSearchModel => _bookSearchModel;

  int _currentBook = 0;
  int get currentBooks => _currentBook;
  
  final List<Item> _addedBooks = [];
  List<Item> get addedBooks => _addedBooks;

  List<Item>? homePageBooks;

  Future<BookSearchModel?> searchBooks(String query) async {
    _bookSearchModel = await locator.get<BooksRepository>().fetchSearchBooks(query);
    return _bookSearchModel;
  }
  
  void addBooks(Item bookItem){
    _addedBooks.add(bookItem);    
    notifyListeners();
  }

  void updateCurrentBookIndex(){
    _currentBook++;
  }

  void setCurrentBookIndexToZero(){
    _currentBook = 0;
  }

}
