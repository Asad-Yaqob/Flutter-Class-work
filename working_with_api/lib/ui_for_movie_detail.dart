import 'package:flutter/material.dart';

class MovieDetailUi extends StatefulWidget {
  const MovieDetailUi({super.key});

  @override
  State<MovieDetailUi> createState() => _MovieDetailUiState();
}

class _MovieDetailUiState extends State<MovieDetailUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.withOpacity(0.1)
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 120),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("images/movie-profile.jpeg", fit: BoxFit.contain),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("MOONLIGHT", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Length", style: TextStyle(color: Colors.grey)),
                  Text("Language", style: TextStyle(color: Colors.grey)),
                  Text("Rating", style: TextStyle(color: Colors.grey)),
                  Text("Reviews", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("02:33:12", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("English", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("+22", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("+40", style: TextStyle(fontWeight: FontWeight.bold)),
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
                      child: const Text("Movies App Design 🎬🎭 designed by MoRas ✪. Connect with them on Dribbble; the global community for designers and creative professionals. ",
                          style: TextStyle(color: Colors.white70) )
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
}
//