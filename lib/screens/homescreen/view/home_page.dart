import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: data != 'initial data...'
    //         ? Text(data.toString())
    //         : const CircularProgressIndicator(),
    //   ),
    // );
    return const Scaffold(
      body: Center(
        child: Text('Books API'),
      ),
    );
  }
}
