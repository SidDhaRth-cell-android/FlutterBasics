import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter09/dashboard_screen.dart';
import 'package:flutter09/login_form.dart';
import 'package:flutter09/models/requests/register_request.dart';
import 'package:flutter09/providers/registration_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationForm extends StatefulWidget {
  RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final _formKey = GlobalKey<FormState>();

  late SharedPreferences _sharedPreferences;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    initializeSharedPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Registration",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 110,
                  child: Stack(
                    children: [
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: capturedImage != null
                                ? Image.file(
                                    File(capturedImage?.path ?? ""),
                                    fit: BoxFit.cover,
                                  )
                                : Center(child: Icon(Icons.person)),
                          )),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () {
                                _showBottomSheetToPickImage(context);
                              },
                              icon: Icon(Icons.camera)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("First Name"),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter first name"),
                      validator: (value) {
                        if (value?.isEmpty == true ||
                            (value?.length ?? 0) < 3) {
                          return "Name cannot be empty and less than 3 characters";
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Job"),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Enter Job"),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Job cannot be empty";
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true &&
                                context
                                        .read<RegistrationProvider>()
                                        .checkIfToggleEnabled() ==
                                    true) {
                              RegisterRequest registerRequest =
                                  RegisterRequest();
                              registerRequest.name = _firstNameController.text;
                              registerRequest.job = _emailController.text;
                              context
                                  .read<RegistrationProvider>()
                                  .registerUser(registerRequest)
                                  .then((onValue) {
                                Fluttertoast.showToast(
                                    msg: "User Registered Successfully");
                              });
                            } else {
                              print("Form is not valid");
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              ),
                              context.watch<RegistrationProvider>().isLoading
                                  ? SizedBox(
                                      height: 18,
                                      width: 18,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        )),
                    Expanded(
                        child: TextButton(
                            onPressed: () async {
                              var dataThatNeedsTobePassedOn = 100;
                              final response = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginForm(
                                            counter: dataThatNeedsTobePassedOn,
                                          )));
                              print(response);
                            },
                            child: Text("Sign in")))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer<RegistrationProvider>(
                        builder: (context, registrationProvider, _) {
                      return Checkbox(
                          value: registrationProvider.isChecked,
                          onChanged: (value) {
                            registrationProvider.toggleCheckBox(value ?? false);
                          });
                    }),
                    Expanded(
                        child: Text(
                            "I agree to the terms and conditions of Privacy Policy"))
                  ],
                ),
                Text(
                    "${context.watch<RegistrationProvider>().registerResponse.toJson()}")
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initializeSharedPreference() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final isUserLogIn = _sharedPreferences.getBool("is_logged_in") ?? false;
    if (isUserLogIn) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => DashboardScreen()));
    }
  }

  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber?.isEmpty == true) {
      return "Phone number cannot be empty";
    } else if (phoneNumber?.length != 10) {
      return "Phone number should be 10 digits";
    }
    return null;
  }

  XFile? capturedImage;

  void _showBottomSheetToPickImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (context) {
          return Dialog(child: ChoosePictureBottomSheet((image) {
            setState(() {
              capturedImage = image;
            });
          }));
        });
  }
}

class ChoosePictureBottomSheet extends StatelessWidget {
  Function(XFile?) onImageCaptured;

  ChoosePictureBottomSheet(this.onImageCaptured, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              _askGalleryPermission();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gallery",
                  style: TextStyle(fontSize: 20),
                ),
                Icon(Icons.add_link_sharp)
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              _checkForCameraPermission();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Camera", style: TextStyle(fontSize: 20)),
                Icon(Icons.add_link_sharp)
              ],
            ),
          )
        ],
      ),
    );
  }

  void _checkForCameraPermission() async {
    final isCameraPermissionGranted = await Permission.camera.status;
    if (isCameraPermissionGranted == PermissionStatus.granted) {
      _showCamera();
    } else {
      Permission.camera.request();
    }
  }

  void _showCamera() async {
    final capturedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    onImageCaptured.call(capturedImage);
  }

  void _askGalleryPermission() async {
    final isGalleryPermissionGranted = await Permission.photos.status;
    if (isGalleryPermissionGranted == PermissionStatus.granted) {
      _showGallery();
    } else {
      Permission.photos.request();
    }
  }

  void _showGallery() async {
    final capturedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    onImageCaptured.call(capturedImage);
  }
}
