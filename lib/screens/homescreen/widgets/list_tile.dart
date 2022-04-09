import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final title;
  final color;
  const MyListTile({
    Key? key,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.book,
        color: color,
      ),
      title: Text(
        title,
      ),
    );
  }
}
