import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyEmailField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;

  const MyEmailField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
  });

  @override
  State<MyEmailField> createState() => _MyEmailFieldState();
}

class _MyEmailFieldState extends State<MyEmailField> {
  String? _errorMessage;

  bool _validateEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  void _onChanged() {
    setState(() {
      if (_validateEmail(widget.controller.text)) {
        _errorMessage = null;
      } else {
        _errorMessage = "Iltimos to'g'ri email address kiriting.";
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
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: const Color(0xff6A6A6A),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xff6A6A6A),
          fontWeight: FontWeight.w300,
        ),
        errorText: _errorMessage,
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class MyTitleField extends StatefulWidget {
  final String hindText;
  final TextEditingController controller;
  final String? nameError;
  const MyTitleField({
    super.key,
    required this.hindText,
    required this.controller,
    this.nameError,
  });

  @override
  State<MyTitleField> createState() => _MyTitleFieldState();
}

class _MyTitleFieldState extends State<MyTitleField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(
            "assets/icons/person.svg",
          ),
        ),
        hintText: widget.hindText,
        errorText: widget.nameError,
        hintStyle: const TextStyle(
          color: Color(0xff6A6A6A),
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
