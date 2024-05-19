import 'package:exam2/pages/register_pages/profile_page.dart';
import 'package:exam2/pages/register_pages/register_page.dart';
import 'package:exam2/widgets/register_button.dart';
import 'package:flutter/material.dart';

class MyDialog {
  static void showAccountActivated(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 80,
                  color: Color(0xff4155FA),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Ro'yxatdan o'tdingiz",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Tabriklayman siz ro'yxatdan o'tgansiz.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            MyButton(
              title: "Ok",
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  static void showAccountNoActivated(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red.shade400,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error,
                  size: 80,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Ro'yxatdan o'ting",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "User Ro'yxatdan o'tmagan. Iltimos qayta urinib ko'ring.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            MyButton(
              title: "Ro'yxatdan o'tish",
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
