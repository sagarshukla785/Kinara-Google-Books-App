import 'package:flutter/material.dart';
import 'package:googe_books_search/screens/homescreen/model/books_search_model.dart';
import 'package:googe_books_search/screens/homescreen/viewmodel/books_view_model.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListOfBooks extends StatelessWidget {
  final double? width;
  final double? height;
  final List<Item>? books;

  const ListOfBooks({
    Key? key,
    this.height,
    this.width,
    this.books,
  }) : super(key: key);

  Widget _getBookCard(Item book, BooksViewModel provider) {
    provider.updateCurrentBookIndex();
    return Column(
      children: [
        Container(
          height: 200,
          width: (width! - 30) / 2,
          color: Colors.orange,
          child: Container(
            margin: const EdgeInsets.all(2),
            child: CachedNetworkImage(
              imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
              fit: BoxFit.cover,
              height: 196,
              width: (width! - 30) / 2,
            ),
          ),
        ),
        Container(
          color: Colors.orange,
          width: (width! - 30) / 2,
          padding: const EdgeInsets.only(top:2, left: 4, right: 4, bottom: 6),
          alignment: Alignment.center,
          child: Text(
            book.volumeInfo?.title ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _getRows(int length, int columns, BooksViewModel provider) {
    List<Widget> finalList = [];

    for (int i = 0; i < length; i++) {
      finalList.add(columns > 1
          ? Row(children: [
              _getBookCard(books![provider.currentBooks], provider),
              const SizedBox(width: 10),
              _getBookCard(books![provider.currentBooks], provider),
            ])
          : Row(children: [
              _getBookCard(books![provider.currentBooks], provider),
            ]));
      finalList.add(const SizedBox(height: 10));
      columns = columns - 2;
    }

    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    int length = books!.length;
    int rows = (length / 2).ceil();

    final provider = Provider.of<BooksViewModel>(context);
    provider.setCurrentBookIndexToZero();

    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      height: height,
      width: width,
      child: SingleChildScrollView(
        child: Column(
          children: _getRows(rows, length, provider),
        ),
      ),
    );
  }
}
