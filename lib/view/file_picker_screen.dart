import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  XFile? _cameraImage;
  XFile? _galleryImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  _pickImageFromCamera();
                },
                child: Text("Pick Image From camera")),
            if (_cameraImage != null)
              Image.file(File(_cameraImage?.path ?? ""), height: 200,),
            ElevatedButton(
                onPressed: () {
                  _pickImageFromGallery();
                },
                child: Text("Pick Image From Gallery")),
            if (_galleryImage != null)
              Image.file(File(_galleryImage?.path ?? ""),  height: 200,),
          ],
        ),
      ),
    );
  }

  void _pickImageFromCamera() async {
    _cameraImage = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void _pickImageFromGallery() async {
    _galleryImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {});
  }
}
