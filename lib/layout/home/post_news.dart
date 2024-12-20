// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:my_flutter/layout/models/albums.dart';

// class PostNews extends StatefulWidget {
//   const PostNews({super.key});

//   @override
//   State<PostNews> createState() => _PostNewsState();
// }

// class _PostNewsState extends State<PostNews> {
//   TextEditingController postController = TextEditingController();
//   Future<Album> createAlbum(String title) async {
//     final response = await http.post(
//       Uri.parse(
//         'https://jsonplaceholder.typicode.com/albums',
//       ),
//       headers: <String, String>{
//         'content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(
//         <String, String>{
//           'title': title,
//         },
//       ),
//     );

//     if (response.statusCode == 201) {
//       return Album.fromJson(
//         jsonDecode(response.body) as Map<String, dynamic>,
//       );
//     } else {
//       throw Exception('Failed to create album.');
//     }
//   }

//   Future<Album>? _futureAlbums;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Data Example'),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(8),
//         child: (_futureAlbums == null) ? buildColumn():buildFutureBuilder(),
//       ),
//     );
//   }
// }

// Column buildColumn(){
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       TextField(
//         controller: postController,
//         decoration: InputDecoration(hintText: 'Enter Title'),
//       ),
//       ElevatedButton(onPressed: (){
//         setState((){
//           _futureAlbums = createAlbum(_controller.text);
//         });
//       }, child: Text('Create Data'),)
//     ],
//   );
// }


// FutureBuilder<Album> buildFutureBuilder(){
//   return FutureBuilder<Album>(future: _futureAlbums, builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       return Text('${snapshot.data!.title}');
//     }else if(snapshot.hasError)(
//       return Text('${snapshot.error}')
//     )
//       return CircularProgressIndicator();
//   },);
// }

