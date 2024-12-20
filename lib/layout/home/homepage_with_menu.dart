import 'package:flutter/material.dart';
import 'package:my_flutter/layout/home/ListWithCards.dart';
import 'package:my_flutter/layout/home/grid_view_learning.dart';
import 'package:my_flutter/layout/home/news_page.dart';
import 'package:my_flutter/layout/home/posts_news.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    // MyHomePage(title: 'My Homepage'),
    GridViewLearning(),
    ListWithcards(),
    PostsNews(),
    NewsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Bottom Navigation Demo"),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3),
            label: "GridView",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Listview",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: "Post Data",
          ),
        ],
      ),
    );
  }
}
