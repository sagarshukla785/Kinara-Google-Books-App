import 'package:get_it/get_it.dart';
import 'package:googe_books_search/configuration.dart';
import 'package:googe_books_search/phraseapp.dart';
import 'package:googe_books_search/screens/homescreen/model/books_search_model.dart';
import 'package:googe_books_search/screens/homescreen/repository/books_repository.dart';
import 'package:googe_books_search/screens/homescreen/services/books_services.dart';
import 'package:googe_books_search/screens/homescreen/viewmodel/books_view_model.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton(() => BooksViewModel());
  locator.registerLazySingleton(() => BooksRepository());
  locator.registerLazySingleton(() => BooksServices());
  locator.registerLazySingleton(() => BookSearchModel());
  locator.registerLazySingleton(() => Configutation());
  locator.registerLazySingleton(() => PhraseApp());
}