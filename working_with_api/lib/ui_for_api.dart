import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:working_with_api/api_service.dart';
import 'package:working_with_api/ui_for_movie_detail.dart';

//Taught By Sir Abdul Basit.
class FetchApiData extends StatefulWidget {
  const FetchApiData({super.key});

  @override
  State<FetchApiData> createState() => _FetchApiDataState();
}

class _FetchApiDataState extends State<FetchApiData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: FutureBuilder(
            future: MyApiService.getData(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if(snapshot.hasError){
                return const Center(
                  child: Icon(Icons.error, color: Colors.red),
                );
              }

              if(snapshot.hasData){
                Map map = jsonDecode(snapshot.data);
                List movieData = map["tv_shows"];

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: movieData.length,
                    itemBuilder: (context, index) {
                    int movieId = movieData[index]["id"];
                      return GestureDetector(
                        onTap: (){
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${movieData[index]["id"]}")));
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailUi(movieID: movieId),));
                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                                image: NetworkImage("${movieData[index]["image_thumbnail_path"]}"),
                              fit: BoxFit.contain,
                              height: 200,
                            ),
                          ),
                        ),
                      );
                    },
                );
              }
              return Container();
            },),
      ),
    );
  }
}
// ListTile(
// leading: CircleAvatar(
// backgroundImage: NetworkImage("${movieData[index]["image_thumbnail_path"]}"),
// ),
// title: Text("Name: ${movieData[index]["name"]}"),
// subtitle: Text("Start date : ${movieData[index]["start_date"]}"
// ),
// );