import 'package:exam2/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyRecomededContainer extends StatelessWidget {
  final Function() onTap;
  final String image;
  final String starCount;
  final String title;
  const MyRecomededContainer({
    super.key,
    required this.image,
    required this.starCount,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 8.0,
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  image,
                ),
              ),
              const Gap(10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text(
                        starCount,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Gap(screenW * 0.3),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                          color: MyColors.mainBlueColor.withOpacity(0.1),
                        ),
                        child: const Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Appartment",
                            style: TextStyle(
                              color: Color(0xff478FF1),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xff122D4D),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 18,
                        color: Color(0xff415770),
                      ),
                      const Text(
                        "Ocean, Avenue, New York, USA",
                        style: TextStyle(
                          color: Color(0xff415770),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.crop_square_rounded,
                            color: Color(0xff122D4D),
                            size: 18.0,
                          ),
                          Text(
                            "1,225",
                            style: TextStyle(
                              color: Color(0xff122D4D),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10.0),
                      Row(
                        children: [
                          Icon(
                            Icons.monitor,
                            color: Color(0xff122D4D),
                            size: 18.0,
                          ),
                          Text(
                            "3.0",
                            style: TextStyle(
                              color: Color(0xff122D4D),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Gap(10.0),
                      const Text(
                        "340/ monthly",
                        style: const TextStyle(
                          color: Color(0xff0066FF),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
