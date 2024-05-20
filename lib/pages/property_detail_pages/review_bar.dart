import 'package:exam2/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ReviewBar extends StatelessWidget {
  const ReviewBar({super.key});

  Widget titleSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xff2A2B3F),
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleSection("Review"),
        const ReviewSection(),
        const Divider(),
        const ReviewSection(),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "View all 172 reviews",
              style: TextStyle(
                color: Colors.red.shade700,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Gap(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Image.asset(
                      "assets/images/agent_profile.png",
                    ),
                  ),
                  const Gap(10.0),
                  const Text(
                    "Sandeep S.",
                    style: TextStyle(
                      color: Color(0xff2A2B3F),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Text(
                "2 month ago",
                style: TextStyle(
                  color: Color(0xff5F5F5F),
                ),
              ),
            ],
          ),
          const Gap(20.0),
          const Text(
            "Lorem Ipsum is simply dummy text of the printing.Lorem Ipsum is simply dummy text of the printing.",
            style: TextStyle(
              color: Color(0xff7A7A7A),
              fontSize: 15,
            ),
          ),
          const Gap(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  StarDisplayWidget(
                    value: 5,
                    filledStar: Icon(
                      Icons.star,
                      color: Color(0xffEEA651),
                    ),
                    unfilledStar: Icon(Icons.star_border_outlined),
                  ),
                  Gap(8.0),
                  Text(
                    "5.0",
                    style: TextStyle(
                      color: Color(0xff8997A9),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Helpful?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(10.0),
                  SvgPicture.asset("assets/icons/like_icon.svg"),
                  const Text("1"),
                  const Gap(10.0),
                  SvgPicture.asset("assets/icons/dislike_icon.svg"),
                  const Text("2"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 140,
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: [
                Image.asset("assets/images/room1.png"),
                Image.asset("assets/images/room2.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
