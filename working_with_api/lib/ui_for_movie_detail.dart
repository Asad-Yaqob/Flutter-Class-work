import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:working_with_api/api_service.dart';

class MovieDetailUi extends StatefulWidget {
  final int movieID;
  const MovieDetailUi({super.key, required this.movieID});

  @override
  State<MovieDetailUi> createState() => _MovieDetailUiState();
}

class _MovieDetailUiState extends State<MovieDetailUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.movieID}"),
      ),
      body: FutureBuilder(
          future: MyApiService.getSpecificData(widget.movieID),
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
              String movieName = map["tvShow"]["name"];
              String movieDescription = map["tvShow"]["description"];
              String movieCountry = map["tvShow"]["country"];
              String movieStatus = map["tvShow"]["status"];
              String movieNetwork = map["tvShow"]["network"];
              String movieRating = map["tvShow"]["rating"];
              String movieImage = map["tvShow"]["image_thumbnail_path"];
              List sliderImages = map["tvShow"]["pictures"];

              double rating = double.parse(movieRating) / 2 ;

              return Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                         CarouselSlider(items: List.generate(sliderImages.length, (index) =>  Container(
                           height: 400,
                           decoration: BoxDecoration(
                             color: Colors.lightBlue.withOpacity(0.1),
                             image: DecorationImage(
                               fit: BoxFit.cover,
                                 image: NetworkImage("${sliderImages[index]}"))
                           ),
                         ),
                         ), 
                        options: CarouselOptions(
                          height:400,
                          autoPlay: true,
                          viewportFraction: 1.0,
                          autoPlayInterval: Duration(milliseconds: 2000),
                          scrollDirection: Axis.vertical,
                          autoPlayCurve: Easing.legacyAccelerate
                        )
                         ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 150),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(movieImage, fit: BoxFit.contain),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(movieName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Country", style: TextStyle(color: Colors.grey)),
                            Text("Status", style: TextStyle(color: Colors.grey)),
                            Text("Network", style: TextStyle(color: Colors.grey)),
                            Text("Rating", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(movieCountry, style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(movieStatus, style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(movieNetwork, style: TextStyle(fontWeight: FontWeight.bold)),
                            RatingBarIndicator(
                              rating: rating,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height:MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10,),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 15),
                                child: const Text("Description", style: TextStyle(fontSize: 15, color: Colors.white70, fontWeight: FontWeight.bold))),
                            const SizedBox(height: 10),
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 15),
                                child:  Text(movieDescription,
                                    style: const TextStyle(color: Colors.white70) )
                            ),
                            const SizedBox(height: 30),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: const Center(child: Text("Watch Now", style: TextStyle(color: Colors.white))),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },)
    );
  }
}
//