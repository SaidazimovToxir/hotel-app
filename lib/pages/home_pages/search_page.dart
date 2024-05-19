import 'package:exam2/model/favorite_model_selected.dart';
import 'package:exam2/model/recomended_model.dart';
import 'package:exam2/pages/home_pages/filter_page.dart';
import 'package:exam2/utils/my_colors.dart';
import 'package:exam2/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<RecomendedModel> _foundedModels = [];
  List<SelectedModel> favoriteSelectedList = [];

  @override
  void initState() {
    super.initState();
    _foundedModels = recomendedModelList;
  }

  void onSearch(String search) {
    setState(() {
      _foundedModels = recomendedModelList
          .where((model) =>
              model.title.toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color(0xff122D4D),
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: MySearchField(
                        checkButtonOrField: true,
                        onSearch: onSearch,
                      ),
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
            const SizedBox(height: 20.0),
            Expanded(
              child: _foundedModels.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: _foundedModels.length,
                      itemBuilder: (context, index) {
                        final items = _foundedModels[index];
                        bool isFavorite = favoriteSelectedList.any((item) =>
                            item.title == items.title &&
                            item.image == items.image);
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
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                items.image,
                                width: screenW * 0.5,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  top: 10.0,
                                ),
                                child: Text(
                                  items.title,
                                  style: const TextStyle(
                                    color: Color(0xff2F2F2F),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          items.price,
                                          style: const TextStyle(
                                            color: Color(0xff0066FF),
                                          ),
                                        ),
                                        const Gap(5.0),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/location_icon.svg",
                                              width: 12,
                                            ),
                                            // const Gap(10.0),
                                            const Text(
                                              "Avenue, West",
                                              style: TextStyle(
                                                color: Color(0xffB9B9B9),
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (!isFavorite) {
                                            favoriteSelectedList.add(
                                              SelectedModel(
                                                image: items.image,
                                                title: items.title,
                                                price: items.price,
                                              ),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: MyColors
                                                    .mainBlueColor
                                                    .withOpacity(0.6),
                                                content: Text(
                                                  'Add to list ${items.title}',
                                                  style: const TextStyle(
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                            );
                                          } else {
                                            favoriteSelectedList.removeWhere(
                                                (item) =>
                                                    item.title == items.title &&
                                                    item.image == items.image);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor:
                                                    Colors.red.shade300,
                                                content: Text(
                                                  'Removed from favorites: ${items.title}',
                                                  style: const TextStyle(
                                                      fontSize: 16.0),
                                                ),
                                              ),
                                            );
                                          }
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: const Color(0xffE5F0FF),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10.0,
                                            horizontal: 12.0,
                                          ),
                                          child: SvgPicture.asset(
                                            "assets/icons/bookmark_icon.svg",
                                            width: 14,
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
                    )
                  : const Center(
                      child: Text(
                        'Malumot topilmadi',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
