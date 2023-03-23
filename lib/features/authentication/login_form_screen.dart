import 'package:e_commerce_flutter/constants/gaps.dart';
import 'package:e_commerce_flutter/features/home_screen.dart';
import 'package:flutter/material.dart';
import 'widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  static const String routeName = "/login_form";
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const Homescreen(),
            ),
            (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 200),
        alignment: Alignment.center,
        child: Form(
            key: _formKey,
            child: SizedBox(
              width: 500,
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Gaps.v28,
                  Text(
                    '이 사이트가 처음이신가요? 회원가입',
                    style: Theme.of(context).textTheme.headlineMedium,
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
                        formData['email'] = newValue;
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
    );
  }
}
