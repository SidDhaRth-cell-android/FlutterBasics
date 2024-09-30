import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter09/view/screens/login_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

const methodChannel = MethodChannel("com.example.flutter09");

doSomeExpensiveWork() {
  for (double i = 0; i < 1000000000000000000; i++) {
    print(i);
  }
}

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late SharedPreferences _sharedPreferences;

  late ImagePicker _imagePicker;
  XFile? _galleryImage;
  XFile? _cameraImage;

  @override
  void initState() {
    _imagePicker = ImagePicker();
    /* context
        .read<UserViewmodel>()
        .getListOfUsers("https://reqres.in/api/users?page=1");*/
    // _initSharedPref();
    super.initState();
  }

  void _initSharedPref() async {
    // _sharedPreferences = await SharedPreferences.getInstance();
    // final response = await methodChannel.invokeMethod("Display");
    // await compute(doSomeExpensiveWork(), "Message");
    //await doSomeExpensiveWork();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _sharedPreferences.setBool("isLoggedIn", false);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginPage()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _pickImageFromGallery();
              },
              child: Text("Pick Image From Gallery ${_galleryImage?.name}")),
          if (_galleryImage != null)
            Image.file(
              File(_galleryImage?.path ?? ""),
              width: double.infinity,
              height: 150,
            ),
          ElevatedButton(
              onPressed: () {
                _pickImageFromCamera();
              },
              child: Text("Pick Image From Camera")),
          if (_cameraImage != null)
            Image.file(
              File(_cameraImage?.path ?? ""),
              width: double.infinity,
              height: 150,
            ),
        ],
      ) /* Consumer<UserViewmodel>(
        builder: (BuildContext context, UserViewmodel value, Widget? child) {
          return value.userListResponse.data != null
              ? ListView.builder(
                  itemCount: value.userListResponse.data?.length,
                  itemBuilder: (context, index) {
                    final user = value.userListResponse.data?[index];
                    return ListTile(
                      title: Text("${user?.first_name} ${user?.last_name}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(user?.email ?? ""),
                          TextButton(
                              onPressed: () {
                                context.read<UserViewmodel>().postUserData(
                                    "https://reqres.in/api/users");
                                */ /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UserDetailScreen(
                                      userResponse: user,
                                    )));*/ /*
                              },
                              child: Text("Hire Me!"))
                        ],
                      ),
                      leading: Image.network(user?.avatar ?? ""),
                    );
                  })
              : Center(child: CircularProgressIndicator());
        },
      )*/
      ,
    );
  }

  void _pickImageFromGallery() async {
    _galleryImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void _pickImageFromCamera() async {
    if (await _isCameraPermissionGranted()) {
      _cameraImage = await _imagePicker.pickImage(source: ImageSource.camera);
      setState(() {});
    }
  }

  Future<bool> _isCameraPermissionGranted() async {
    bool _isGranted = false;
    _isGranted = await Permission.camera.isGranted;
    if (_isGranted) {
      return _isGranted;
    } else {
      await Permission.camera.request().then((permissionStatus) {
        if (permissionStatus.isGranted == PermissionStatus.granted) {
          _isGranted = true;
          return _isGranted;
        }
        return _isGranted;
      }, onError: (_, __) {
        return _isGranted;
      });
      return _isGranted;
    }
  }
}
