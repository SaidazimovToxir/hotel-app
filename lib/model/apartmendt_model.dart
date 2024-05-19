class ApartmendtModel {
  String image;
  String starCount;
  String title;

  ApartmendtModel({
    required this.image,
    required this.starCount,
    required this.title,
  });
}

List<ApartmendtModel> apartmendtModelList = [
  ApartmendtModel(
    image: "assets/images/home_near.png",
    starCount: "4.9",
    title: "Woodline Apartment",
  ),
  ApartmendtModel(
    image: "assets/images/home_near.png",
    starCount: "2",
    title: "Apartment",
  ),
  ApartmendtModel(
    image: "assets/images/home_near.png",
    starCount: "5",
    title: "kvartira",
  ),
  ApartmendtModel(
    image: "assets/images/home_near.png",
    starCount: "3",
    title: "Honadon",
  ),
  ApartmendtModel(
    image: "assets/images/home_near.png",
    starCount: "2",
    title: "Uy",
  ),
];
