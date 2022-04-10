import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/phraseapp.dart';
import 'package:googe_books_search/screens/homescreen/model/books_search_model.dart';
import 'package:googe_books_search/screens/homescreen/repository/books_repository.dart';

class BooksViewModel extends ChangeNotifier {
  BookSearchModel? _bookSearchModel;
  BookSearchModel? get bookSearchModel => _bookSearchModel;
  String? userId;
  bool isUserIdSet = false;
  bool readAllBooksFromDB = false;

  String? currentFilter = locator.get<PhraseApp>().all;

  int _currentBook = 0;
  int get currentBooks => _currentBook;
  String defaultFilter = locator.get<PhraseApp>().all;

  List<Item> _addedBooks = [];
  List<Item> get addedBooks => _getBooks();

  List<String> _filters = [locator.get<PhraseApp>().all];
  List<String> get filters => _filters.toSet().toList();

  Future<BookSearchModel?> searchBooks(String query) async {
    _bookSearchModel =
        await locator.get<BooksRepository>().fetchSearchBooks(query);
    return _bookSearchModel;
  }

  void addBooks(Item bookItem) {
    _addedBooks.add(bookItem);
    _addUserBooksInFireBase(bookItem);
    _filters.add(bookItem.volumeInfo?.categories?.first ?? '');
    notifyListeners();
  }

  void updateCurrentBookIndex() {
    _currentBook++;
  }

  void setCurrentBookIndexToZero() {
    _currentBook = 0;
  }

  void setCurrentFilterName(String filterName){
    currentFilter = filterName;
    notifyListeners();
  }

  void setUserId(String id){
    userId = id;
    isUserIdSet = true;
    readAllBooksFromDB = false;
    _addedBooks.clear();
  }

  List<Item> _getBooks() {
    List<Item> _finalList = [];
    
    if(currentFilter?.toLowerCase() == defaultFilter){
      return _addedBooks;
    }

    for(int i = 0; i < _addedBooks.length; i++){
      if(_addedBooks[i].volumeInfo?.categories?.first.toLowerCase() == currentFilter?.toLowerCase()){
        _finalList.add(_addedBooks[i]);
      }
    }

    return _finalList;
  }

  Future _addUserBooksInFireBase(Item bookItem) async {
    var docUser = FirebaseFirestore.instance.collection(userId.toString()).doc(bookItem.id);
    await docUser.set(bookItem.toJson());
  }

  void readUserBooks() async {
    print("readUserBooks: called");
    final snapshot = await FirebaseFirestore.instance.collection(userId ?? '').get();
    _addedBooks = (snapshot.docs.map((data) => Item.fromJson(data.data()))).toList();
    _filters = _addedBooks.map((e) => e.volumeInfo?.categories?.first ?? '').toList();
    _filters.insert(0, defaultFilter);
    readAllBooksFromDB = true;
    notifyListeners();
  }
}
