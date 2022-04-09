import 'package:flutter/material.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/screens/homescreen/repository/books_repository.dart';
import 'package:googe_books_search/screens/homescreen/services/books_services.dart';
import 'package:googe_books_search/screens/homescreen/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locator.get<BooksRepository>().fetchSearchBooks(),
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Books App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
