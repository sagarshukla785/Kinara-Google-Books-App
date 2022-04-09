import 'package:flutter/material.dart';
import 'package:googe_books_search/locator.dart';
import 'package:googe_books_search/phraseapp.dart';
import 'package:googe_books_search/screens/loginscreen/viewmodel/google_sign_in_view_model.dart';
import 'package:googe_books_search/screens/loginscreen/widgets/google_books_logo.dart';
import 'package:googe_books_search/screens/loginscreen/widgets/login_cta.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String signInText = locator.get<PhraseApp>().signInWithGoogle;
    String books = locator.get<PhraseApp>().books;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          final provider =
              Provider.of<GoogleSignInViewModel>(context, listen: false);
          provider.googleSignIn();
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: height * .6 - 130),
                alignment: Alignment.bottomCenter,
                height: height * .6,
                child: GoogleLogo(
                  text: books,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: height * .4,
                child: LoginCta(
                  text: signInText,
                  width: width,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
