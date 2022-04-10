import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  String name;
  double height;
  UserName({
    Key? key,
    required this.name,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: height,
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.orange,
          fontSize: 24,
        ),
      ),
    );
  }
}
