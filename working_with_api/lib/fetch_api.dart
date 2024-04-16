import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class FetchApi extends StatefulWidget {
  const FetchApi({super.key});

  @override
  State<FetchApi> createState() => _FetchApiState();
}

class _FetchApiState extends State<FetchApi> {
  late List<Map<String, dynamic>> posts;

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async{
  var request = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  var response = await http.get(request);

  if(response.statusCode == 200){
    List<dynamic> jsonData = jsonDecode(response.body);

    setState(() {
      posts = jsonData.map((dynamic post){
        return {
        'userId': post['id'],
        'body': post['body'],
        };
      }).toList();
    });
  }
  else{
    debugPrint("Failed to fetch data");
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Fetching Data With Api"),
          centerTitle: true,
       ),
      body: posts == null ? Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("userId: ${posts[index]['userId']}", textAlign: TextAlign.center,),
              Text("userId: ${posts[index]['body']}"),
            ],
          ),
        );
      },)
    );
  }
}
