import 'package:flutter/material.dart';
import 'package:gettingstarted/testfile.dart';

class LearningNavigation extends StatefulWidget {
  const LearningNavigation({super.key});

  @override
  State<LearningNavigation> createState() => _LearningNavigationState();
}

class _LearningNavigationState extends State<LearningNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Navigation Bar", style: TextStyle(fontSize:20,color: Colors.white),)),
        backgroundColor: Colors.grey,
      ),
      body: (
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap:(){
              print("Gesture is clicked");
          },
            child: Container(
              width: 300,
              height: 100,
              color: Colors.blue,
            ),
          ),
          Container(
            width: 300,
            height: 100,
            color: Colors.green,
          ),
          Container(
            width: 300,
            height: 100,
            color: Colors.red,
          ),
          ElevatedButton(onPressed: (){
            //print("button is clicked");

            //We can display a message dialog through this..
           // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Moddle pop up dialog")));

            //To navigate from one page to another..
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ContainerUi()));
          }, child: Text("Go to another page"))
        ],
      )
      ),
    );
  }
}
