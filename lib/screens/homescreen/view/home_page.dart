import 'package:flutter/material.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/phraseapp.dart';
import 'package:googe_books_search/screens/homescreen/widgets/search_icon.dart';

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
      body: Center(
        child: Text(noBooks),
      ),
    );
  }
}
