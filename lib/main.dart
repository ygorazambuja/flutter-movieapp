import 'package:bshare/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Database',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
