import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:  Form(
    child: Column(
      children: [
        TextFormField(
          controller: email,
          decoration: InputDecoration(
            label: Text("Enter Email"),
            hintText: "abc@gmail.com",
            prefixIcon: Icon(Icons.email)
          ),
        ),
        TextFormField(
          controller: pass,
          decoration: InputDecoration(
              label: Text("Enter Pass"),
              prefixIcon: Icon(Icons.lock)
          ),
        ),
        ElevatedButton(onPressed: (){
          String uemail = email.text;
          String upass = pass.text;
          if(uemail.isNotEmpty && upass.isNotEmpty) {
            FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: uemail, password: upass);
          }
        }, child: Text("sign up"))
      ],
    )
),
    );
  }
}
