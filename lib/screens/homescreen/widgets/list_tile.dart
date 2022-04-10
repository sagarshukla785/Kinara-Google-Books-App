import 'package:flutter/material.dart';
import 'package:googe_books_search/screens/homescreen/model/books_search_model.dart';
import 'package:googe_books_search/screens/homescreen/viewmodel/books_view_model.dart';
import 'package:provider/provider.dart';

class MyListTile extends StatelessWidget {
  final Item item;
  final color;
  const MyListTile({
    Key? key,
    required this.item,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = item.volumeInfo?.title ?? '';
    final provider = Provider.of<BooksViewModel>(context, listen: false);
    
    return ListTile(
      leading: Icon(
        Icons.book,
        color: color,
      ),
      title: Text(
        title,
      ),
      trailing: InkWell(
        onTap: (){
          provider.addBooks(item);
        },
        child: Icon(
          Icons.add,
          color: color,
        ),
      ),
    );
  }
}
