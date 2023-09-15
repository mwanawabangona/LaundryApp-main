import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundryapp/controller/auth_controller.dart';
import 'package:laundryapp/utils/constants.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  final AuthController _authController = AuthController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoadding = false;

  late String email;
  late String password;
  late String confirmPassword;
  late String fullName;

  void _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoadding = true;
      });
      String res = await _authController.createNewUser(
          email, fullName, password, confirmPassword);
      if (res == "success") {
        Get.snackbar('Account', 'Account created successfully');
        Navigator.of(context).pushNamed("/login");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res),
          ),
        );
      }
      setState(() {
        _isLoadding = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Constants.primaryColor,
          body: SafeArea(
            child: Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 0.0,
                    top: -20.0,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        "assets/images/washing_machine_illustration.png",
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: (Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  "Create an account",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Sign up to get started!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height,
                              constraints: BoxConstraints(
                                minHeight:
                                    MediaQuery.of(context).size.height - 180.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextFormField(
                                    onChanged: (value) {
                                      fullName = value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter your full name";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Full Name",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Constants.primaryColor,
                                          ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextFormField(
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter your email";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Email Address",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Constants.primaryColor,
                                          ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextFormField(
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "PassWord Cannot be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Constants.primaryColor,
                                          ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextFormField(
                                    onChanged: (value) {
                                      confirmPassword = value;
                                    },
                                    validator: (value) {
                                      if (value! == "password") {
                                        return "PassWord dont match";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Confirm Password",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Constants.primaryColor,
                                          ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Constants.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          return _register();
                                        },
                                        child: _isLoadding
                                            ? CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : Text("Sign Up"),
                                        style: ElevatedButton.styleFrom(
                                          primary: Constants.primaryColor,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 16.0,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have an account?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Constants.primaryColor,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed("/login");
                                        },
                                        child: Text(
                                          "Log in",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Constants.primaryColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
