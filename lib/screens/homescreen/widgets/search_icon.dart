import 'package:flutter/material.dart';
import 'package:googe_books_search/screens/homescreen/widgets/book_search.dart';

class SearchIcon extends StatelessWidget {
  final Color color;
  const SearchIcon({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showSearch(
          context: context,
          delegate: BookSearch(),
        );
      },
      icon: Icon(
        Icons.search,
        color: color,
      ),
    );
  }
}
