import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String userName;

  NewPage(this.userName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Text(
          'Welcome to $userName\ page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}