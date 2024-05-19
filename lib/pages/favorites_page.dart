import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:exam2/model/favorite_model_selected.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Page"),
      ),
      body: favoriteSelectedList.isNotEmpty
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 130,
              ),
              itemCount: favoriteSelectedList.length,
              itemBuilder: (context, index) {
                final favoriteItem = favoriteSelectedList[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      favoriteSelectedList.removeAt(index);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red.shade300,
                        content: Text(
                          '${favoriteItem.title} removed',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.red.shade300,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                          Image.asset(
                            favoriteItem.image,
                          ),
                          const Gap(10.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favoriteItem.title,
                                style: const TextStyle(
                                  color: Color(0xff2F2F2F),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                favoriteItem.price,
                                style: const TextStyle(
                                  color: Color(0xff0066FF),
                                  fontSize: 16,
                                ),
                              ),
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
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "Malumot yo'q",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
