import 'package:exam2/utils/my_colors.dart';
import 'package:exam2/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int buttonIndex = 0;
  int currentCategoryIndex = 0;
  int currentCategoryIndex2 = 0;
  int currentCategoryIndexnumber = 0;
  double _currentSliderSecondaryValue = 0.5;
  int _rating = 5;
  String? _selectedRadioValue;

  Widget titleTextStyle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xff2A2B3F),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget ratingBarItems(int rating, String text, String radioValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            StarDisplayWidget(
              value: rating,
              filledStar: const Icon(
                Icons.star,
                color: Color(0xffEEA651),
                size: 30,
              ),
              unfilledStar: const Icon(
                Icons.star_border,
                color: Color(0xffE2EBFF),
                size: 30,
              ),
            ),
            const SizedBox(width: 20.0),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xff2A2B3F),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Radio<String>(
          activeColor: const Color(0xff122D4D),
          value: radioValue,
          groupValue: _selectedRadioValue,
          onChanged: (String? value) {
            setState(
              () {
                _selectedRadioValue = value;
              },
            );
          },
        ),
      ],
    );
  }

  List<String> categoryList = [
    "All",
    "House",
    "Villa",
    "Appartment",
    "Hotel",
  ];

  List<String> categoryNumberList = [
    "7",
    "1+",
    "2+",
    "4+",
    "5+",
    "6+",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color(0xff122D4D),
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                print("object");
              },
              borderRadius: BorderRadius.circular(50),
              child: SvgPicture.asset(
                'assets/icons/search_icon.svg',
                color: Color(0xff122D4D),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleTextStyle("Category"),

            //? Start category section
            SizedBox(
              height: 50,
              child: ListView.separated(
                  padding: const EdgeInsets.only(left: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (context, index) => const Gap(20.0),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        currentCategoryIndex = index;
                        setState(() {});
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        label: Text(
                          categoryList[index],
                          style: TextStyle(
                            color: currentCategoryIndex == index
                                ? Colors.white
                                : null,
                          ),
                        ),
                        side: BorderSide.none,
                        backgroundColor: currentCategoryIndex == index
                            ? MyColors.mainBlueColor
                            : const Color(0xffF4F6F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    );
                  }),
            ),
            //* End the Category section
            const Gap(20.0),

            //? Start the Price range section
            titleTextStyle("Price Range"),
            Slider(
              activeColor: MyColors.mainBlueColor,
              value: _currentSliderSecondaryValue,
              label: _currentSliderSecondaryValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderSecondaryValue = value;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$100"),
                  Text("\$500"),
                  Text("\$1000"),
                  Text("\$1500"),
                  Text("\$3000"),
                  Text("\$5000"),
                ],
              ),
            ),
            //* End the price range section
            const Gap(20.0),

            //? Start the rating bar section
            titleTextStyle("Reviews"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ratingBarItems(_rating, "4.5 and above", '1'),
                  ratingBarItems(_rating, "4.0-4.5", '2'),
                  ratingBarItems(_rating - 1, '3.0-4.0', '3'),
                  ratingBarItems(_rating - 2, '3.0-3.5', '4'),
                  ratingBarItems(_rating - 3, '2.5-3.0', '5'),
                ],
              ),
            ),
            //* End the rating bar seciton
            const Gap(20.0),

            //? Start category section
            titleTextStyle("Category"),
            SizedBox(
              height: 50,
              child: ListView.separated(
                  padding: const EdgeInsets.only(left: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (context, index) => const Gap(20.0),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        currentCategoryIndex2 = index;
                        setState(() {});
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        label: Text(
                          categoryList[index],
                          style: TextStyle(
                            color: currentCategoryIndex2 == index
                                ? Colors.white
                                : null,
                          ),
                        ),
                        side: BorderSide.none,
                        backgroundColor: currentCategoryIndex2 == index
                            ? MyColors.mainBlueColor
                            : const Color(0xffF4F6F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    );
                  }),
            ),
            //* End the Category section
            const Gap(20.0),

            //? Start category section
            titleTextStyle("Category"),
            SizedBox(
              height: 50,
              child: ListView.separated(
                  padding: const EdgeInsets.only(left: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryNumberList.length,
                  separatorBuilder: (context, index) => const Gap(20.0),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        currentCategoryIndexnumber = index;
                        setState(() {});
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        label: Text(
                          categoryNumberList[index],
                          style: TextStyle(
                            color: currentCategoryIndexnumber == index
                                ? Colors.white
                                : null,
                          ),
                        ),
                        side: BorderSide.none,
                        backgroundColor: currentCategoryIndexnumber == index
                            ? MyColors.mainBlueColor
                            : const Color(0xffF4F6F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    );
                  }),
            ),
            //* End the Category section
            const Gap(20.0),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 12.0,
            )
          ],
        ),
        child: Row(
          children: [
            tabButtons(0, "Reset Filter"),
            tabButtons(1, "Apply"),
          ],
        ),
      ),
    );
  }

  Widget tabButtons(int index, String name) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            buttonIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            color: buttonIndex == index ? MyColors.mainBlueColor : Colors.white,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: buttonIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
