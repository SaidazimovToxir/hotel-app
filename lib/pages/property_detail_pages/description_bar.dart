import 'package:exam2/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DescriptionBar extends StatelessWidget {
  const DescriptionBar({super.key});

  Widget cardDesign(String image, String title, [String? count]) {
    return Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: SvgPicture.asset(
              image,
            ),
          ),
          Text(
            count ?? "",
            style: const TextStyle(
              color: Color(0xff006EFF),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff6B6B6B),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget titleSection(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xff2A2B3F),
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 130,
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
              ),
              children: [
                cardDesign(
                  "assets/icons/sqf_icon.svg",
                  "sqft",
                  "1,225",
                ),
                cardDesign(
                  "assets/icons/bedrooms_icon.svg",
                  "Bedrooms",
                  "1,225",
                ),
                cardDesign(
                  "assets/icons/bathrooms_icon.svg",
                  "Bathrooms",
                  "1,225",
                ),
                cardDesign(
                  "assets/icons/safety_icon.svg",
                  "Safety Rank",
                  "1,225",
                ),
              ],
            ),
          ),
          titleSection("Listing Agent"),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 30.0, right: 10),
            child: Row(
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sandeep S.",
                          style: TextStyle(
                            color: Color(0xff2A2B3F),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Partner",
                          style: TextStyle(
                            color: Color(0xff8C8C8C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/message_icon.svg'),
                    const Gap(20.0),
                    SvgPicture.asset('assets/icons/phone_icon.svg'),
                  ],
                ),
              ],
            ),
          ),
          titleSection("Facilities"),
          SizedBox(
            height: 240,
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
              ),
              children: [
                cardDesign(
                  "assets/icons/car_icon.svg",
                  "Car Parking",
                ),
                cardDesign(
                  "assets/icons/swim_icon.svg",
                  "Swimming",
                ),
                cardDesign(
                  "assets/icons/gym_icon.svg",
                  "Gym & Fit",
                ),
                cardDesign(
                  "assets/icons/restaurant_icon.svg",
                  "Restaurant",
                ),
                cardDesign(
                  "assets/icons/wifi_icon.svg",
                  "Car Parking",
                ),
                cardDesign(
                  "assets/icons/pet_icon.svg",
                  "Car Parking",
                ),
                cardDesign(
                  "assets/icons/sport_icon.svg",
                  "Car Parking",
                ),
                cardDesign(
                  "assets/icons/laundry_icon.svg",
                  "Car Parking",
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleSection("Address"),
              Text(
                "View on Map",
                style: TextStyle(
                  color: MyColors.mainBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 0.5,
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/location_icon.svg",
                width: 20,
                color: const Color(0xff2A2B3F),
              ),
              const Gap(10.0),
              const Text(
                "Ut nulla irure adipisicing aliqua magna ea.",
                style: TextStyle(
                  color: Color(0xff2A2B3F),
                  fontSize: 15,
                ),
              )
            ],
          ),
          const Gap(10.0),
          Image.asset('assets/images/map.png')
        ],
      ),
    );
  }
}
