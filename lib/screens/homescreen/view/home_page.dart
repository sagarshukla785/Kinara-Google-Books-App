import 'package:flutter/material.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/phraseapp.dart';
import 'package:googe_books_search/screens/homescreen/viewmodel/books_view_model.dart';
import 'package:googe_books_search/screens/homescreen/widgets/list_of_books.dart';
import 'package:googe_books_search/screens/homescreen/widgets/search_icon.dart';
import 'package:googe_books_search/screens/loginscreen/viewmodel/google_sign_in_view_model.dart';
import 'package:provider/provider.dart';

class _Constants {
  static const transparent = Colors.transparent;
  static const whiteColor = Colors.white;
  static const orangeColor = Colors.orange;
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = locator.get<PhraseApp>().appTitle;
    String noBooks = locator.get<PhraseApp>().noBooks;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final booksViewModelProvider = Provider.of<BooksViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: _Constants.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: _Constants.orangeColor,
        shadowColor: _Constants.transparent,
        actions: const [
          SearchIcon(
            color: _Constants.whiteColor,
          )
        ],
      ),
      body: booksViewModelProvider.addedBooks.isEmpty
          ? Center(
              child: Text(noBooks),
            )
          : ListOfBooks(
              height: height,
              width: width,
              books: booksViewModelProvider.addedBooks,
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _Constants.orangeColor,
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInViewModel>(context, listen: false);
          provider.logout();
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
