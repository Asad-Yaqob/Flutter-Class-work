import 'package:flutter/material.dart';

class MovieUi extends StatefulWidget {
  const MovieUi({super.key});

  @override
  State<MovieUi> createState() => _MovieUiState();
}

class _MovieUiState extends State<MovieUi> {
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
          color: Colors.lightBlue.withOpacity(0.1),
      ),
    ),
    Center(
    child: Container(
    margin: const EdgeInsets.only(top: 150),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(25),
    child: Image.network("https://scontent.fkhi17-1.fna.fbcdn.net/v/t39.30808-6/347859974_800515388169640_7488332834941733162_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHyC2FX68m_FmYrJIW1Vsp4iJmTXt9NHxKImZNe300fEgx6b7uhD95vkffSboSSDOJy7ydTPN_NKMnO_5dwJhKY&_nc_ohc=d6A1aqjdn1IAb7rylNT&_nc_ht=scontent.fkhi17-1.fna&oh=00_AfB21_9NjhCjfpXukrWY-iNB2OBqz4O4OQhi2UWHiYlzvw&oe=662C8F47", height: 300,  fit: BoxFit.contain),
    ),
    ),
    ),
    ],
    ),
    const SizedBox(height: 60),
    Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child:  const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text("Moonlight", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
    child:  const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text("USA", style: TextStyle(fontWeight: FontWeight.bold),),
    Text("Ended", style: TextStyle(fontWeight: FontWeight.bold)),
    Text("HBO", style: TextStyle(fontWeight: FontWeight.bold)),
    Text("4.5", style: TextStyle(fontWeight: FontWeight.bold)),
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
    child:  const Text("Moviee Description display here",
    style: TextStyle(color: Colors.white70) )
    ),
    const SizedBox(height: 30),
    Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
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
    );;
  }
}
