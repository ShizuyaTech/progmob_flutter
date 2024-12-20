import 'package:flutter/material.dart';
import 'package:my_flutter/layout/models/get_news.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'apiPage/news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<List<GetNews>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var getPostsdata = json.decode(response.body) as List;
      var listPosts = getPostsdata.map((i) => GetNews.fromJson(i)).toList();
      return listPosts;
    } else {
      throw Exception('failed to load posts');
    }
  }

  late Future<List<GetNews>> futurePosts;

  @override
  void initState() {
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: FutureBuilder<List<GetNews>>(
            future: futurePosts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    var post = (snapshot.data as List<GetNews>)[index];
                    return Column(
                      children: [
                        NewsCard(
                          getNews: GetNews(
                              id: post.id, title: post.title, body: post.body),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: (snapshot.data as List<GetNews>).length,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
