import 'package:flutter/material.dart';
import 'package:my_flutter/layout/home/news_page.dart';
import 'package:my_flutter/layout/home/posts_news.dart';
import './layout/home/homepage_with_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
          useMaterial3: true,
        ),
        home: PostsNews());
  }
}
