import 'package:flutter/material.dart';
import 'package:my_flutter/layout/models/get_news.dart';
import 'detail_news_page.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.getNews});

  final GetNews getNews;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return DetailNewsPage(getNews: getNews);
            }),
          ),
        );
      },
      // perbaikan ada pada bagian ini, dimana sebelumnya tidak menggunakan widget card
      // kode sesudah perbaikan
      child: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.3,
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  Text(
                    getNews.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(getNews.body),
                ],
              ),
            ),
          ),
        ),

        // kode sebelum perbaikan
        //   child: Container(
        //     // width: 500,
        //     // height: 200,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //     ),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           getNews.title,
        //           style: TextStyle(fontWeight: FontWeight.bold),
        //         ),
        //         SizedBox(height: 20),
        //         Text(getNews.body),
        //       ],
        //     ),
        //   ),
      ),
    );
  }
}
