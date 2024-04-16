import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class YtImgUpload extends StatefulWidget {
  const YtImgUpload({super.key});

  @override
  State<YtImgUpload> createState() => _YtImgUploadState();
}

class _YtImgUploadState extends State<YtImgUpload> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
 final path = 'myimages/${pickedFile!.name}';
 final file = File(pickedFile!.path!);

 final ref = FirebaseStorage.instance.ref().child(path);

 setState(() {
   uploadTask = ref.putFile(file);

 });

 final snapshot = await uploadTask!.whenComplete(() => {});
 final downloadUrl = await snapshot.ref.getDownloadURL();
 print("Downlaod link: $downloadUrl");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pickedFile != null)
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Center(child: Text(pickedFile!.name)),
                  // child: Image.file(
                  //   File(pickedFile!.path!),
                  //   width: 200,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: selectFile, child: const Text("Select File")),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: uploadFile, child: const Text("Upload File")),
          ],
        ),
      ),
    );
  }
}
