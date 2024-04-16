import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  TextEditingController userID = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPass = TextEditingController();

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
              onTap: () {
                Map<String, dynamic> addUsers = {
                  "UserId": userID.text,
                  "UserName": userName.text,
                  "UserEmail": userEmail.text,
                  "UserPass": userPass.text
                };

                FirebaseFirestore.instance.collection("users").add(addUsers);
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: CupertinoColors.activeBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                    child: Text("Add",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
