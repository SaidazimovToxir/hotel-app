import 'package:exam2/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryBar extends StatelessWidget {
  const GalleryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "Gellery ",
                  style: TextStyle(
                    color: Color(0xff2A2B3F),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "(400)",
                  style: TextStyle(
                    color: MyColors.mainBlueColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: [
                Image.asset("assets/images/room1.png"),
                Image.asset("assets/images/room2.png"),
                Image.asset("assets/images/room3.png"),
                Image.asset("assets/images/room4.png"),
                Image.asset("assets/images/room5.png"),
                Image.asset("assets/images/room6.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
