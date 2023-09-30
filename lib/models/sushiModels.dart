class SushiModels {
  final String name;
  final String price;
  final String imagePath;
  final String rating;
  SushiModels(
    this.name,
    this.price,
    this.imagePath,
    this.rating,
  );

  // метод для получения доступа
  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
}
