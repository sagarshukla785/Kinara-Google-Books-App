import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/screens/homescreen/viewmodel/books_view_model.dart';
import 'package:googe_books_search/screens/loginscreen/viewmodel/google_sign_in_view_model.dart';
import 'package:googe_books_search/widgets/stream_builder_login_state.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BooksViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => GoogleSignInViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Books App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppLoginStates(),
    );
  }
}
