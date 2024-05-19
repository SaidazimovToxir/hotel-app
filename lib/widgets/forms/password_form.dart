import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class MyPasswordField extends StatefulWidget {
  final bool checkEye;
  final Function() onPressed;
  final TextEditingController controller;

  MyPasswordField({
    super.key,
    required this.checkEye,
    required this.onPressed,
    required this.controller,
  });

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  // final TextEditingController _controller = TextEditingController();
  String? _errorMessage;

  bool _validatePassword(String password) {
    if (password.length < 8) return false;

    if (!RegExp(r'[A-Z]').hasMatch(password)) return false;

    if (!RegExp(r'[a-z]').hasMatch(password)) return false;

    if (!RegExp(r'\d').hasMatch(password)) return false;

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) return false;

    return true;
  }

  void _onChanged() {
    setState(() {
      if (_validatePassword(widget.controller.text)) {
        _errorMessage = null;
      } else {
        _errorMessage = "Iltimos to'g'ri parol kiriting '@3Ffhg6r'";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onChanged);
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          obscureText: !widget.checkEye,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(color: Color(0xff6A6A6A)),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                "assets/icons/password_icon.svg",
              ),
            ),
            suffixIcon: IconButton(
              onPressed: widget.onPressed,
              icon: Icon(
                widget.checkEye ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                color: const Color(0xff6A6A6A),
              ),
            ),
            hintText: "••••••••••",
            hintStyle: const TextStyle(
              color: Color(0xff6A6A6A),
              fontWeight: FontWeight.w300,
            ),
            errorText: _errorMessage,
          ),
        ),
      ],
    );
  }
}
