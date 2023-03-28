import 'dart:convert';

import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/features/authentication/login_form_screen.dart';
import 'package:e_commerce_flutter/features/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/form_button.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/sign_up";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        var response = await http.post(
          Uri.parse("http://121.172.36.156:8080/register"),
          body: jsonEncode(formData),
          headers: {"content-type": "application/json"},
        );
        if (response.statusCode == 200) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => const Homescreen()),
              (Route<dynamic> route) => false);
        } else {
          setState(() {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 200),
          alignment: Alignment.center,
          child: Form(
              key: _formKey,
              child: SizedBox(
                width: 350,
                child: Column(
                  children: [
                    Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Gaps.v28,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '이미 회원이신가요? ',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        GestureDetector(
                          onTap: _onLoginTap,
                          child: Text(
                            '로그인 하기',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 110, 9, 9),
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.fontWeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Plase write your email";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['account'] = newValue;
                        }
                      },
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                    Gaps.v16,
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Plase write your password";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['password'] = newValue;
                        }
                      },
                      decoration: const InputDecoration(hintText: 'Password'),
                    ),
                    Gaps.v16,
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Plase write your name";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['name'] = newValue;
                        }
                      },
                      decoration: const InputDecoration(hintText: 'Name'),
                    ),
                    Gaps.v16,
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Plase write your phone";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['phone'] = newValue;
                        }
                      },
                      decoration: const InputDecoration(hintText: 'phone'),
                    ),
                    Gaps.v16,
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Plase write your adress";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData['adress'] = newValue;
                        }
                      },
                      decoration: const InputDecoration(hintText: 'adress'),
                    ),
                    Gaps.v28,
                    GestureDetector(
                      onTap: _onSubmitTap,
                      child: const FormButton(
                        disabled: false,
                        title: 'Log in',
                      ),
                    ),
                    Gaps.v56,
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _onLoginTap() {
    context.pop(LoginFormScreen.routeName);
  }
}