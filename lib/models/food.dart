class Food {
  final String name;
  final String imagePath;
  final double price;
  final FoodCategory category;

  Food({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.category,
  });
}


enum FoodCategory {
  coffee,
  tea,
  sandwich,
}

