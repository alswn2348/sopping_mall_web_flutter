import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/features/admin/view/admin_screen.dart';
import 'package:e_commerce_flutter/features/authentication/logic/view_model/auth_vm.dart';
import 'package:e_commerce_flutter/features/authentication/views/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'widgets/form_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";
  static const String routeURL = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        _login();
      }
    }
  }

  void _login() async {
    await context.read<AuthenticartionViewModel>().login(formData);

    await isAdmin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 200),
          alignment: Alignment.center,
          child: Form(
              key: _formKey,
              child: SizedBox(
                width: 350,
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Gaps.v28,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '이 사이트가 처음이신가요? ',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        GestureDetector(
                          onTap: _onSignUpTap,
                          child: Text(
                            '회원가입',
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
                    Gaps.v32,
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
                    Gaps.v28,
                    GestureDetector(
                      onTap: _onSubmitTap,
                      child: const FormButton(
                        disabled: false,
                        title: 'Log in',
                      ),
                    ),
                    Gaps.v56,
                    const Text('비밀번호를 잊어 버렸나요? ')
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _onSignUpTap() {
    context.pushNamed(SignUpScreen.routeName);
  }

  Future<void> isAdmin() async {
    var role = context.read<AuthenticartionViewModel>().getRole!;
    if (role.first.toString().contains("ADMIN")) {
      context.goNamed(AdminScreen.routeName);
    } else {
      context.go("/home");
    }
  }
}
