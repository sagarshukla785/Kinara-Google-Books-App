import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/phraseapp.dart';
import 'package:googe_books_search/screens/homescreen/view/home_page.dart';
import 'package:googe_books_search/screens/loginscreen/view/sign_in_screen.dart';
import 'package:googe_books_search/screens/loginscreen/viewmodel/google_sign_in_view_model.dart';
import 'package:googe_books_search/widgets/stream_builder_login_state.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInViewModel(),
      child: MaterialApp(
        title: 'Books App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AppLoginStates(),
      ),
    );
  }
}
