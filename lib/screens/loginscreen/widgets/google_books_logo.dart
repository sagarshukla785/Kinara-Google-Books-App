import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _Constant {
  static const Color organeColor = Colors.orange;
  static const Color whiteColor = Colors.white;
}

class GoogleLogo extends StatelessWidget {
  final String text;
  GoogleLogo({Key? key, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FaIcon(
          FontAwesomeIcons.google,
          color: _Constant.organeColor,
          size: 80,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 30,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: _Constant.organeColor,
          ),
        ),
      ],
    );
  }
}
