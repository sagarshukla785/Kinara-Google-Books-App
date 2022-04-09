import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/phraseapp.dart';
import 'package:googe_books_search/screens/homescreen/view/home_page.dart';
import 'package:googe_books_search/screens/loginscreen/view/sign_in_screen.dart';

class AppLoginStates extends StatelessWidget {
  const AppLoginStates({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String errorMessage = locator.get<PhraseApp>().errorMessage;
    
    return StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Colors.orange,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(errorMessage),
              );
            }
            else if(snapshot.hasData){
              return const HomePage();
            }
            else{
              return const SignIn();
            }
          },
        );
  }
}