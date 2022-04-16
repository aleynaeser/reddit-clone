import 'package:flutter/material.dart';

import 'package:reddit_clone/core/utils/themes.dart';
import 'view/home/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Clone',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      home: const HomePage(),
    );
  }
}
