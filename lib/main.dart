import 'package:crawldata/views/home.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme:   ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}