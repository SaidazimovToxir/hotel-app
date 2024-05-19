class RecomendedModel {
  String image;
  String title;
  String price;

  RecomendedModel({
    required this.image,
    required this.title,
    required this.price,
  });
}

List<RecomendedModel> recomendedModelList = [
  RecomendedModel(
    image: "assets/images/home1.png",
    title: "Lorem house",
    price: "\$440/month",
  ),
  RecomendedModel(
    image: "assets/images/home2.png",
    title: "Beautiful home",
    price: "\$340/month",
  ),
  RecomendedModel(
    image: "assets/images/home3.png",
    title: "3 home",
    price: "\$30/month",
  ),
  RecomendedModel(
    image: "assets/images/home4.png",
    title: "4 home",
    price: "\$40/month",
  ),
  RecomendedModel(
    image: "assets/images/home5.png",
    title: "5 home",
    price: "\$340/month",
  ),
  RecomendedModel(
    image: "assets/images/home6.png",
    title: "6 home",
    price: "\$340/month",
  ),
  RecomendedModel(
    image: "assets/images/home7.png",
    title: "7 home",
    price: "\$5640/month",
  ),
  RecomendedModel(
    image: "assets/images/home8.png",
    title: "8 home",
    price: "\$100/month",
  ),
];
