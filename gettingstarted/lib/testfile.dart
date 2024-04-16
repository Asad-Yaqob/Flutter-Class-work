import 'package:flutter/material.dart';

import 'navigation.dart';

class ContainerUi extends StatefulWidget {
  const ContainerUi({super.key});

  @override
  State<ContainerUi> createState() => _ContainerUiState();
}

class _ContainerUiState extends State<ContainerUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LearningNavigation()));
              } ,
              child: Container(
                child: Image.asset(
                  'images/img1.webp',
                  width: 100, // Set your desired width
                  height: 100, // Set your desired height
                ),
              ),
            ),
            SizedBox(height: 20), // Add some space between image and text
            const Text(
              'We can also use navigation in Gesture Detector, So click the image to go back to navigation page.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
