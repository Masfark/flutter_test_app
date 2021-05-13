import 'package:flutter/material.dart';
import 'package:flutter_test_app/pages/home_page.dart';
import 'package:flutter_test_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test App',
      theme: myTheme(),
      home: MyHomePage(),
    );
  }
}
