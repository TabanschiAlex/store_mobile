class Product {
  final int id;
  final String title, description;
  final List<dynamic> images;
  final double price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    this.isFavourite = false,
    this.isPopular = true,
    required this.title,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: int.parse(json['id']),
        images: json['images'] ?? [],
        title: json['title'],
        price: double.parse(json['price']),
        description: json['description']);
  }
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/popular_products/ps4_console_white_1.png",
      "assets/images/popular_products/ps4_console_white_2.png",
      "assets/images/popular_products/ps4_console_white_3.png",
      "assets/images/popular_products/ps4_console_white_4.png",
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    isFavourite: false,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
