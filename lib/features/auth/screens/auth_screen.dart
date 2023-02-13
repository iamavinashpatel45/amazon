import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/auth/services/auth_service.dart';
import 'package:amazon/widgets/button.dart';
import 'package:amazon/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

enum Auth {
  signin,
  signup,
}

class auth_screen extends StatefulWidget {
  const auth_screen({Key? key}) : super(key: key);

  @override
  State<auth_screen> createState() => _auth_screenState();
}

class _auth_screenState extends State<auth_screen> {
  Auth _auth = Auth.signup;
  bool _signup = false;
  bool _signin = false;
  final _signupkey = GlobalKey<FormState>();
  final _signinkey = GlobalKey<FormState>();
  final auth_service authservice = auth_service();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  void signup() async {
    _signup = await authservice.signup(_namecontroller.text,
        _emailcontroller.text, _passwordcontroller.text, context);
  }

  void signin() async {
    _signup = await authservice.signin(
        _emailcontroller.text, _passwordcontroller.text, context);
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _namecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global_variables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? global_variables.backgroundColor
                    : global_variables.greyBackgroundCOlor,
                title: const Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: global_variables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  color: global_variables.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Form(
                        key: _signupkey,
                        child: Column(
                          children: [
                            textformfield(
                              controller: _namecontroller,
                              hinttext: 'Name',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            textformfield(
                              controller: _emailcontroller,
                              hinttext: 'Email',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            textformfield(
                              controller: _passwordcontroller,
                              hinttext: 'Password',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: _signup
                                  ? LoadingAnimationWidget.threeRotatingDots(
                                      color: global_variables.secondaryColor,
                                      size: 50,
                                    )
                                  : button(
                                      text: "Sign-UP",
                                      ontap: () {
                                        if (_signupkey.currentState!
                                            .validate()) {
                                          setState(() {
                                            _signup = true;
                                            signup();
                                          });
                                        }
                                      },
                                    ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? global_variables.backgroundColor
                    : global_variables.greyBackgroundCOlor,
                title: const Text(
                  "Sign-In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: global_variables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  color: global_variables.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Form(
                        key: _signinkey,
                        child: Column(
                          children: [
                            textformfield(
                              controller: _emailcontroller,
                              hinttext: 'Email',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            textformfield(
                              controller: _passwordcontroller,
                              hinttext: 'Password',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: _signin
                                  ? LoadingAnimationWidget.threeRotatingDots(
                                      color: global_variables.secondaryColor,
                                      size: 50,
                                    )
                                  : button(
                                      text: "Sign-In",
                                      ontap: () {
                                        if (_signinkey.currentState!
                                            .validate()) {
                                          setState(() {
                                            _signin = true;
                                            signin();
                                          });
                                        }
                                      },
                                    ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
