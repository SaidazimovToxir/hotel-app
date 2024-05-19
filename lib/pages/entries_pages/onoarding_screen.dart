import 'package:exam2/pages/register_pages/log_in_page.dart';
import 'package:exam2/utils/my_colors.dart';
import 'package:exam2/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  PageController _controller = PageController();
  List imagesList = [
    "assets/images/onboarding1.png",
    "assets/images/onboarding2.png",
    "assets/images/onboarding3.png",
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          const Gap(60),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: imagesList.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset(
                    imagesList[i],
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              children: [
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Lorem ",
                        style: MyStyles.textStyle(false),
                      ),
                      TextSpan(
                        text: "impsum is simply ",
                        style: MyStyles.textStyle(true),
                      ),
                      TextSpan(
                        text: "dummy text printing",
                        style: MyStyles.textStyle(false),
                      ),
                    ],
                  ),
                ),
                const Gap(10.0),
                const Text(
                  "occaecat quis. Cillum nisi officia ea laborum consectetur magna reprehenderit das.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Gap(screenH * 0.2),

          /// [Buttons -> Next and Continue]
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentIndex > 0
                    ? IconButton(
                        style: IconButton.styleFrom(
                          side: BorderSide(
                            color: MyColors.mainBlueColor,
                          ),
                        ),
                        onPressed: () {
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.decelerate,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: MyColors.mainBlueColor,
                        ),
                      )
                    : const SizedBox(width: 50.0),

                /// [Dots -> Scrool dots]
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => buildDot(index, context),
                  ),
                ),

                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: MyColors.mainBlueColor,
                  ),
                  onPressed: () {
                    if (_currentIndex == imagesList.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInPage(),
                        ),
                      );
                    }

                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate,
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.grey.shade200,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: MyColors.mainBlueColor),
                  ),
                ),
              ],
            ),
          ),

          const Gap(30.0),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _currentIndex == index ? 15 : 10,
      width: _currentIndex == index ? 15 : 10,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: _currentIndex == index
            ? const Color(0xff4155FA)
            : const Color.fromARGB(255, 228, 234, 234),
        borderRadius: _currentIndex == index
            ? BorderRadius.circular(50)
            : BorderRadius.circular(100),
      ),
      child: AnimatedOpacity(
        opacity: _currentIndex == index ? 1.0 : 0.5,
        duration: const Duration(
          milliseconds: 300,
        ),
      ),
    );
  }
}
