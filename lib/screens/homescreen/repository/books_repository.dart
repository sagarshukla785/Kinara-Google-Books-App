import 'package:googe_books_search/configuration.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/screens/homescreen/model/books_search_model.dart';
import 'package:googe_books_search/screens/homescreen/services/books_services.dart';

class BooksRepository {
   String host = locator.get<Configutation>().host;
   String endpoint = locator.get<Configutation>().searchBooksEndpoint;

   Future<BookSearchModel> fetchSearchBooks (String query) async{
     String response = await locator.get<BooksServices>().get(host, endpoint, query).then((value) {
       return value;
     });
     
     return bookSearchModelFromJson(response);
   }
}