import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Estate App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Add Property'),
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              },
            ),
            ElevatedButton(
              child: Text('Style PDF'),
              onPressed: () {
                Navigator.pushNamed(context, '/pdf_style');
              },
            ),
          ],
        ),
      ),
    );
  }
}