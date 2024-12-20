import 'package:flutter/material.dart';
import 'package:my_flutter/layout/models/get_news.dart';

class DetailNewsPage extends StatelessWidget {
  final GetNews getNews;
  const DetailNewsPage({super.key, required this.getNews});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      // perbaikan ada dibagian ini dengan penambahan widget card
      // kode sesudah perbaikan
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Card(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'id: ${getNews.id}',
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Title: ${getNews.title}',
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Body: ${getNews.body}',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // kode sebelum perbaikan
        // child: Column(
        //   children: [
        //     Text(
        //       'id: ${getNews.id}',
        //     ),
        //     Text(
        //       'Title: ${getNews.title}',
        //     ),
        //     SizedBox(height: 20),
        //     Text(
        //       'Body: ${getNews.body}',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
