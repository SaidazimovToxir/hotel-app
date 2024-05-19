import 'package:exam2/widgets/dialog_box.dart';
import 'package:exam2/widgets/forms/password_form.dart';
import 'package:exam2/widgets/forms/user_form.dart';
import 'package:exam2/widgets/register_button.dart';
import 'package:exam2/widgets/register_from_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool checkEye = false;
  bool checkRegister = false;
  String? nameError;
  String check = '';

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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Username",
                        style: TextStyle(
                          color: Color(0xff091130),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    MyTitleField(
                      hindText: "Username",
                      controller: _usernameController,
                      nameError: nameError,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Color(0xff091130),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    MyPasswordField(
                      checkEye: checkEye,
                      onPressed: () {
                        setState(() {
                          checkEye = !checkEye;
                        });
                      },
                      controller: _passwordController,
                    ),
                  ],
                ),
                const Gap(30.0),
                MyButton(
                  title: "Log in",
                  onPressed: () async {
                    final logInUsername = _usernameController.text;
                    final logInPassword = _passwordController.text;
                    if (logInUsername.isEmpty) {
                      nameError = "Iltimos Username kiriting";
                      setState(() {});
                    } else {
                      nameError = null;
                    }

                    final List<dynamic>? arguments = ModalRoute.of(context)
                        ?.settings
                        .arguments as List<dynamic>?;

                    if (logInUsername.isNotEmpty && logInPassword.isNotEmpty) {
                      if (arguments != null) {
                        if (logInUsername == arguments[0] &&
                            logInPassword == arguments[1]) {
                          MyDialog.showAccountActivated(context);
                        } else {
                          MyDialog.showAccountNoActivated(context);
                        }
                      } else {
                        MyDialog.showAccountNoActivated(context);
                      }
                    } else {
                      _usernameController.clear();
                      _passwordController.clear();
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
