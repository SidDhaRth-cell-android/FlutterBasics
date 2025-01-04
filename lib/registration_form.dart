import 'package:flutter/material.dart';
import 'package:flutter09/dashboard_screen.dart';
import 'package:flutter09/login_form.dart';
import 'package:flutter09/providers/registration_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    print("CALLED");
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
                Text("Email"),
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
                          border: InputBorder.none, hintText: "Enter email"),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Email cannot be empty";
                        } else if (!emailRegex.hasMatch(value ?? "")) {
                          return "Invalid Email";
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
                Text("Password"),
                Consumer<RegistrationProvider>(
                  builder: (_, registrationProvider, __) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: !registrationProvider.isPasswordShown,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter password",
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    registrationProvider
                                        .handlePasswordVisibility();
                                  },
                                  icon: Icon(
                                      registrationProvider.isPasswordShown
                                          ? Icons.visibility
                                          : Icons.visibility_off))),
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return "Password cannot be empty";
                            } else if (value?.length != 10) {
                              return "Password should be 10 digits";
                            }
                            return null;
                          },
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Phone number"),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter phone number"),
                      validator: validatePhoneNumber,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                              final firstName = _firstNameController.text;
                              final email = _emailController.text;
                              final password = _passwordController.text;
                              final phoneNumber = _phoneNumberController.text;
                              _sharedPreferences.setString(
                                  "first_name", firstName);
                              _sharedPreferences.setString("email", email);
                              _sharedPreferences.setString(
                                  "password", password);
                              _sharedPreferences.setString(
                                  "phone_number", phoneNumber);
                              _sharedPreferences.setBool(
                                  "is_terms_and_conditions_accepted", true);
                              Fluttertoast.showToast(
                                  msg:
                                      "You're registered successfully. Please login now.");
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginForm()));
                              });
                            } else {
                              print("Form is not valid");
                            }
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
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
                )
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
}
