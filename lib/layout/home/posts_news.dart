import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostsNews extends StatefulWidget {
  const PostsNews({super.key});

  @override
  State<PostsNews> createState() => _PostsNewsState();
}

class _PostsNewsState extends State<PostsNews> {
  TextEditingController postController = TextEditingController();

  String hasilResponse = "Belum ada data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post News'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: postController,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Title',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              var response = await http.post(
                Uri.parse('https://jsonplaceholder.typicode.com/albums'),
                body: {
                  'title': postController.text,
                },
              );
              var data = json.decode(response.body) as Map<String, dynamic>;
              setState(() {
                hasilResponse = '${data['title']}';
              });
            },
            child: Text('Create Data'),
          ),
          SizedBox(height: 50),
          Divider(color: Colors.black),
          SizedBox(height: 30),
          Text(hasilResponse),
        ],
      ),
    );
  }
}
