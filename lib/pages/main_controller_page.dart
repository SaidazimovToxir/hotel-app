import 'package:exam2/pages/favorites_page.dart';
import 'package:exam2/pages/home_pages/home_page.dart';
import 'package:exam2/pages/location_page.dart';
import 'package:exam2/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class MainControllerPage extends StatefulWidget {
  const MainControllerPage({super.key});

  @override
  State<MainControllerPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainControllerPage> {
  final _screens = [
    const HomePage(),
    const LocationPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];

  List<String> listOfIcons = [
    "assets/icons/home_icon.svg",
    "assets/icons/location_bar_icon.svg",
    "assets/icons/bookmark_bar_icon.svg",
    "assets/icons/person_bar_icon.svg",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.transparent,
        child: ListView.separated(
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Gap(60.0),
          padding: EdgeInsets.symmetric(horizontal: screenW / 6.5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    listOfIcons[index],
                    width: 25,
                    color: index == currentIndex
                        ? const Color(0xff3C94FF)
                        : const Color(0xff8694A6),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    height: index == currentIndex ? 8 : 0,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == currentIndex
                          ? const Color(0xff3C94FF)
                          : null,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: _screens[currentIndex],
    );
  }
}
