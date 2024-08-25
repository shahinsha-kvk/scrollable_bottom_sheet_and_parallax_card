class CardModel {
  final String name, image, date;

  CardModel({required this.name, required this.image, required this.date});
}

List<CardModel> demoCardData = [
  CardModel(
    name: "THE BAFTA AWARD 2018",
    image: "121.jpg",
    date: "1.20-28",
  ),
  CardModel(
    name: "THE PALME D'OR 2020",
    image: "310.jpg",
    date: "2.63-75",
  ),
  CardModel(
    name: "THE PULITZER PRIZE 2011",
    image: "615.jpg",
    date: "4.20-30",
  ),
  CardModel(
    name: "THE GOLDEN GLOBES 2017",
    image: "816.jpg",
    date: "6.20-30",
  ),
  CardModel(
    name: "THE BRITS AWARD 2022",
    image: "982.jpg",
    date: "5.78-99",
  ),
];
