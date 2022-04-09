import 'package:flutter/material.dart';

class _Constant {
  static const Color loginCtaColor = Colors.orange;
  static const Color loginCtaTextColor = Colors.white;
}

class LoginCta extends StatelessWidget {
  String text;
  double width;
  LoginCta({
    Key? key,
    required this.width,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      height: 50,
      width: width - 50,
      color: _Constant.loginCtaColor,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
          color: _Constant.loginCtaTextColor,
        ),
      ),
    );
  }
}
