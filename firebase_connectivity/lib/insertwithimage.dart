import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageUploading extends StatefulWidget {
  const ImageUploading({super.key});

  @override
  State<ImageUploading> createState() => _ImageUploadingState();
}

class _ImageUploadingState extends State<ImageUploading> {
  TextEditingController userID = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPass = TextEditingController();
  File? Profilepic;
  String DownloadUrl = ' ';

  Future ImageUpload() async {
    UploadTask uploadTask = FirebaseStorage.instance.ref().child("myimages").child(const Uuid().v1()).putFile(Profilepic!);
    TaskSnapshot taskSnapshot = await uploadTask;
    DownloadUrl = await taskSnapshot.ref.getDownloadURL();
  }

  void useradd({String? imgurl}) async {
    Map<String, dynamic> useradd = {
      "UserId": userID.text.toString(),
      "UserName": userName.text.toString(),
      "UserEmail": userEmail.text.toString(),
      "UserPass": userPass.text.toString(),
      "image": imgurl
    };
    await FirebaseFirestore.instance.collection("users").add(useradd);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Data In Collection! ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white)),
        backgroundColor: CupertinoColors.activeBlue,
      ),
      body: Form(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            TextFormField(
              controller: userID,
              decoration: const InputDecoration(
                  label: Text("User Id"),
                  hintText: "Enter User Id",
                  prefixIcon: Icon(Icons.numbers, color: Colors.blueAccent)),
            ),
            TextFormField(
              controller: userName,
              decoration: const InputDecoration(
                  label: Text("User Name"),
                  hintText: "Enter User Name",
                  prefixIcon: Icon(Icons.abc, color: Colors.blueAccent)),
            ),
            TextFormField(
              controller: userEmail,
              decoration: const InputDecoration(
                  label: Text("User Email"),
                  hintText: "Enter User Email",
                  prefixIcon: Icon(Icons.email, color: Colors.blueAccent)),
            ),
            TextFormField(
              controller: userPass,
              obscureText: true,
              decoration: const InputDecoration(
                  label: Text("User Pass"),
                  hintText: "Enter User Pass",
                  prefixIcon: Icon(Icons.lock, color: Colors.blueAccent)),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () async {
              XFile? selectedimage = await ImagePicker().pickImage(source: ImageSource.gallery);
              if(selectedimage != null){
                File convertedFile = File(selectedimage.path);
                setState(() {
                  Profilepic = convertedFile;
                });
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No Image Selected")));
                }

              },
              child: CircleAvatar(
                radius: 80,
                backgroundImage: (Profilepic != null) ? FileImage(Profilepic!) : null,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
