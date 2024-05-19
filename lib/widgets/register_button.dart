import 'package:exam2/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyButton extends StatelessWidget {
  final String title;
  Function() onPressed;
  MyButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.mainBlueColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              letterSpacing: 2,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class MyLogoButton extends StatelessWidget {
  final String imgUrl;
  final String title;
  const MyLogoButton({
    super.key,
    required this.imgUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        // width: screenW * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                imgUrl,
                width: 25,
              ),
              const Gap(10.0),
              Text(
                title,
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
