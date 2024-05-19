import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterFromWeb extends StatelessWidget {
  final double screenW;
  const RegisterFromWeb({
    super.key,
    required this.screenW,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/arrow_line_icon.svg",
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Or Continue with",
                  style: TextStyle(
                    color: Color(0xff616161),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/icons/arrow_back_line_icon.svg",
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenW * 0.2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                "assets/icons/google_icon.svg",
                width: 25,
              ),
              SvgPicture.asset(
                "assets/icons/apple_icon.svg",
                width: 25,
              ),
              SvgPicture.asset(
                "assets/icons/facebook_icon.svg",
                width: 25,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
