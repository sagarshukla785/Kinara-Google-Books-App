import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/phraseapp.dart';
import 'package:googe_books_search/screens/homescreen/view/home_page.dart';
import 'package:googe_books_search/screens/homescreen/viewmodel/books_view_model.dart';
import 'package:googe_books_search/screens/loginscreen/view/sign_in_screen.dart';
import 'package:provider/provider.dart';

class AppLoginStates extends StatelessWidget {
  const AppLoginStates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String errorMessage = locator.get<PhraseApp>().errorMessage;
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        userId = FirebaseAuth.instance.currentUser?.uid ?? '';

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: Colors.orange,
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(errorMessage),
          );
        } else if (userId == '') {
          return const SignIn();
        } else {
          return HomePage(
            userId: userId,
            userName: FirebaseAuth.instance.currentUser?.displayName,
          );
        }
      },
    );
  }
}
