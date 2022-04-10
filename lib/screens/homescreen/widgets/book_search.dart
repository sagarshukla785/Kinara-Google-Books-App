import 'package:flutter/material.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/phraseapp.dart';
import 'package:googe_books_search/screens/homescreen/model/books_search_model.dart';
import 'package:googe_books_search/screens/homescreen/viewmodel/books_view_model.dart';
import 'package:googe_books_search/screens/homescreen/widgets/list_tile.dart';

class _Constants {
  static const orangeColor = Colors.orange;
}

class BookSearch extends SearchDelegate<BookSearchModel> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          color: _Constants.orangeColor,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: _Constants.orangeColor,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != '') {
      query = query.replaceAll(' ', '+');
      return FutureBuilder(
        future: locator.get<BooksViewModel>().searchBooks(query),
        builder: (context, AsyncSnapshot<BookSearchModel?> snapshot) {
          final result =
              snapshot.data?.items?.map((e) => e);
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: _Constants.orangeColor,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return ListView(
                  children: result!
                      .map<MyListTile>(
                        (e) => MyListTile(
                          item: e,
                          color: _Constants.orangeColor,
                        ),
                      )
                      .toList(),
                );
              }
          }
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    String text = locator.get<PhraseApp>().noResults;
    return Center(
      child: Text(query != '' ? '' : text),
    );
  }
}
