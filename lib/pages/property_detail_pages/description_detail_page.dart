import 'package:exam2/model/apartmendt_model.dart';
import 'package:exam2/pages/property_detail_pages/description_bar.dart';
import 'package:exam2/pages/property_detail_pages/gallery_bar.dart';
import 'package:exam2/pages/property_detail_pages/review_bar.dart';
import 'package:exam2/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DescriptionDetailPage extends StatefulWidget {
  const DescriptionDetailPage({super.key});

  @override
  State<DescriptionDetailPage> createState() => _DescriptionDetailPageState();
}

class _DescriptionDetailPageState extends State<DescriptionDetailPage>
    with SingleTickerProviderStateMixin {
  int? index;
  bool checkFavorite = false;
  late TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    index = ModalRoute.of(context)?.settings.arguments as int?;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    double screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 80,
            expandedHeight: screenH * 0.5,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                apartmendtModelList[index!].image,
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton.filled(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              style: IconButton.styleFrom(backgroundColor: Colors.white),
            ),
            actions: [
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                ),
                style: IconButton.styleFrom(backgroundColor: Colors.white),
              ),
              const Gap(15.0),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton.filled(
                  onPressed: () {
                    setState(() {
                      checkFavorite = !checkFavorite;
                    });
                  },
                  icon: Icon(
                    checkFavorite
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: checkFavorite ? Colors.redAccent : Colors.black,
                  ),
                  style: IconButton.styleFrom(backgroundColor: Colors.white),
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffEEA651),
                          size: 28.0,
                        ),
                        const Gap(10.0),
                        Text(
                          "${apartmendtModelList[index!].starCount} (6.8K review)",
                          style: const TextStyle(
                            color: Color(0xff8997A9),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Chip(
                      label: Text(
                        "Apartment",
                        style: TextStyle(
                          color: Color(0xff478FF1),
                          fontSize: 15,
                        ),
                      ),
                      side: BorderSide.none,
                      backgroundColor: Color(0xffF4F6F9),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  apartmendtModelList[index!].title,
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Color(0xff2A2B3F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "1012 Ocean avanue, New yourk, USA",
                  style: TextStyle(
                    color: Color(0xff8C8C8C),
                    fontSize: 17,
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: const Color(0xff006EFF),
                indicator: UnderlineTabIndicator(
                  borderSide: const BorderSide(
                    width: 2.0,
                    color: Color(0xff006EFF),
                  ),
                  insets: EdgeInsets.symmetric(horizontal: (screenW / 3) - 30),
                ),
                tabs: const [
                  Tab(
                    child: Text("Description"),
                  ),
                  Tab(
                    child: Text("Gallery"),
                  ),
                  Tab(
                    child: Text("Review"),
                  ),
                ],
              ),
              SizedBox(
                height: screenH + 100,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    DescriptionBar(),
                    GalleryBar(),
                    ReviewBar(),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 85,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8.0,
            )
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        color: Color(0xff2A2B3F),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "\$350",
                            style: TextStyle(
                              color: Color(0xff006EFF),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "/month",
                            style: TextStyle(
                              color: Color(0xff8C8C8C),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: MyColors.mainBlueColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    "Book Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
