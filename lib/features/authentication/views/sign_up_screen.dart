import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/constants/sizes.dart';
import 'package:e_commerce_flutter/features/authentication/logic/view_model/auth_vm.dart';
import 'package:e_commerce_flutter/features/authentication/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'widgets/form_button.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "sign_up";
  static const String routeURL = "/sign_up";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void saveInfo() async {}

  Map<String, String> formData = {};

  void _onSubmitTap() async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        _signUp();
      }
    }
  }

  _signUp() async {
    var response =
        await context.read<AuthenticartionViewModel>().register(formData);
    if (response.statusCode == 200) {
      if (!mounted) return;
      completeDialog();
    } else {
      errorDialog();
    }
  }

  Future<dynamic> errorDialog() {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(Sizes.size60),
          child: const Text("회원가입에 실패하였습니다."),
        ),
      ),
    );
  }

  Future<dynamic> completeDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(Sizes.size60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '회원가입이 완료되었습니다.',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Gaps.v20,
              GestureDetector(
                onTap: () {
                  context.pushNamed(LoginScreen.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.all(Sizes.size10),
                  decoration: const BoxDecoration(color: Colors.blueAccent),
                  child: Text(
                    "로그인 페이지로 이동",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium?.fontSize,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
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
                          formData['address'] = newValue;
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
    context.pop(LoginScreen.routeName);
  }
}
