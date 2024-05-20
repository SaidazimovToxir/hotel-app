import 'package:exam2/pages/register_pages/log_in_page.dart';
import 'package:exam2/widgets/forms/password_form.dart';
import 'package:exam2/widgets/forms/user_form.dart';
import 'package:exam2/widgets/register_button.dart';
import 'package:exam2/widgets/register_from_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool checkEye = false;
  bool checkRegister = false;
  String? nameError;
  String check = '';

  Widget inputTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xff091130),
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 60.0,
                    horizontal: 40.0,
                  ),
                  child: SvgPicture.asset("assets/svg/logo.svg"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color(0xff091130),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    inputTitle("Username"),
                    MyTitleField(
                      hindText: "Username",
                      controller: _usernameController,
                      nameError: nameError,
                    ),
                    inputTitle("Password"),
                    MyPasswordField(
                      checkEye: checkEye,
                      onPressed: () {
                        setState(() {
                          checkEye = !checkEye;
                        });
                      },
                      controller: _passwordController,
                    ),
                    inputTitle("Email Adress"),
                    MyEmailField(
                      icon: Icons.email_outlined,
                      hintText: "example@gmail.com",
                      controller: _emailController,
                    ),
                  ],
                ),
                const Gap(30.0),
                MyButton(
                  title: "Sign in",
                  onPressed: () async {
                    final enteredUsername = _usernameController.text;
                    final enteredEmail = _emailController.text;
                    final enteredPswd = _passwordController.text;

                    if (enteredUsername.isEmpty) {
                      nameError = "Iltimos Username kiriting";
                      setState(() {});
                    } else {
                      nameError = null;
                    }

                    if (enteredEmail.isNotEmpty &&
                        enteredPswd.isNotEmpty &&
                        enteredUsername.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInPage(),
                          settings: RouteSettings(
                            arguments: [enteredUsername, enteredPswd],
                          ),
                        ),
                      );
                    } else {
                      print('Email or password field is empty');
                      _usernameController.clear();
                      _passwordController.clear();
                      _emailController.clear();
                    }
                  },
                ),
                RegisterFromWeb(screenW: screenW),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
