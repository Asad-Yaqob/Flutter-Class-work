import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       margin: EdgeInsets.all(40),
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(50),
                    child: Image.asset("images/main.png")
                ),
                Center(
                  child: Text("Discover Your Dream Job here", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50, color: CupertinoColors.activeBlue, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 50),
                Text("Explore all the existing job roles based on your intrest and study mager",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                SizedBox(height: 50),
                Row(

                )
              ],
            ),

      ),
    );
  }
}

