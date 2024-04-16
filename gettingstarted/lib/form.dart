import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isHide = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Bar", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                child: const Text("Login Form", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue))
              ),
              TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Please Enter Email Address';
                  }
                  return null;
                },
                controller:email,
                decoration: const InputDecoration(
                  label: Text("Enter User Email"), hintText: "Enter User Email",
                  prefixIcon: Icon(Icons.email, color: Colors.blue)
                ),
              ),
              TextFormField(
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please fill The Password Field";
                  }
                  return null;
                },
                controller: pass,
                obscureText: isHide,
                decoration:  InputDecoration(
                    label: Text("Enter Password"), hintText: "Enter Password..",
                    prefixIcon: Icon(Icons.key, color: Colors.blue),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                    isHide = ! isHide;
                    });
                  }, icon:  isHide == true ? Icon(Icons.panorama_fish_eye) : Icon(Icons.remove_red_eye))
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                   print(email.text);
                   print(pass.text);
                   ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:Text("Login Successful")));
                }
              } , child: const Text("Login", style: TextStyle(fontSize: 20, color: Colors.blue)))
            ],
          ),
        ),
      ),
    );
  }
}
