import 'package:flutter/material.dart';
import 'package:flutter_crud/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple CRUD Apps',
        theme: ThemeData(
          primaryColor: Colors.orange,
          accentColor: Colors.orangeAccent,
        ),
      home: HomeScreen(),
    );
  }
}