import 'package:exam2/model/apartmendt_model.dart';
import 'package:exam2/model/category_model.dart';
import 'package:exam2/model/favorite_model_selected.dart';
import 'package:exam2/model/recomended_model.dart';
import 'package:exam2/pages/home_pages/filter_page.dart';
import 'package:exam2/pages/property_detail_pages/description_detail_page.dart';
import 'package:exam2/utils/my_colors.dart';
import 'package:exam2/widgets/recomended_widget.dart';
import 'package:exam2/widgets/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int checkColor = 0;
  bool checkBookmarkColor = false;

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        toolbarHeight: 100,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's Find your",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Color(0xff8997A9),
              ),
            ),
            Text(
              "Favorite home",
              style: TextStyle(
                color: Color(0xff122D4D),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 8.0),
            child: Image.asset("assets/images/user_profile.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //? Start Search and Filter section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: MySearchField(checkButtonOrField: false),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FilterPage(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xff308DFF),
                      ),
                      child: SvgPicture.asset("assets/icons/filter_icon.svg"),
                    ),
                  ),
                ],
              ),
            ),
            //* End the Search and Filter section
            const Gap(16.0),
            //? Start Select category section
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: categorList.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      checkColor = index;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: checkColor == index
                            ? const Color(0xff308DFF).withOpacity(0.3)
                            : const Color(0xffF1F2F4),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          categorList[index].title,
                          style: TextStyle(
                            color: checkColor == index
                                ? const Color(0xff308DFF)
                                : const Color(0xff314865),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //* End the Select category section
            const Gap(25.0),
            //? Start Container information section
            SizedBox(
              height: 380,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const Gap(18.0),
                itemCount: recomendedModelList.length,
                itemBuilder: (context, index) {
                  final items = recomendedModelList[index];
                  bool isFavorite = favoriteSelectedList.any((item) =>
                      item.title == items.title && item.image == items.image);
                  return Container(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          items.image,
                          width: screenW * 0.8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            top: 10.0,
                          ),
                          child: Text(
                            items.title,
                            style: const TextStyle(
                              color: Color(0xff2F2F2F),
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items.price,
                                    style: const TextStyle(
                                      color: Color(0xff0066FF),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Gap(5.0),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/location_icon.svg",
                                        width: 15,
                                      ),
                                      const Gap(10.0),
                                      const Text(
                                        "Avenue, West Side",
                                        style: TextStyle(
                                          color: Color(0xffB9B9B9),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Gap(screenW * 0.2),
                              GestureDetector(
                                onTap: () {
                                  if (!isFavorite) {
                                    favoriteSelectedList.add(
                                      SelectedModel(
                                        image: items.image,
                                        title: items.title,
                                        price: items.price,
                                      ),
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: MyColors.mainBlueColor
                                            .withOpacity(0.6),
                                        content: Text(
                                          'Add to list ${items.title}',
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    );
                                  } else {
                                    favoriteSelectedList.removeWhere((item) =>
                                        item.title == items.title &&
                                        item.image == items.image);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red.shade300,
                                        content: Text(
                                          'Removed from favorites: ${items.title}',
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    );
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: const Color(0xffE5F0FF),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14.0,
                                      horizontal: 16.0,
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/icons/bookmark_icon.svg",
                                      width: 15,
                                      // height: 50,
                                      color: isFavorite
                                          ? const Color(0xff0066FF)
                                          : const Color(0xff8895A7),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            //* End the Container category section

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Near You",
                    style: TextStyle(
                      color: Color(0xff122D4D),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "More",
                    style: TextStyle(
                      color: Color(0xff989898),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            //? Start the Near for you section
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 130,
              ),
              children: [
                for (var i = 0; i < apartmendtModelList.length; i++)
                  MyRecomededContainer(
                    image: apartmendtModelList[i].image,
                    starCount: apartmendtModelList[i].starCount,
                    title: apartmendtModelList[i].title,
                    onTap: () {
                      // print(i);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescriptionDetailPage(),
                          settings: RouteSettings(arguments: i),
                        ),
                      );
                    },
                  ),
              ],
            ),
            //* End the Near for you section
          ],
        ),
      ),
    );
  }
}
