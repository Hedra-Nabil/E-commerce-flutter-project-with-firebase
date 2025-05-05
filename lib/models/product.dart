class Product {
  final String name;
  final String category;
  final double price;
  final double? oldprice;
  final String imageUrl;
  late  bool isFavorite;
  final String description;

   Product({
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldprice,
    this.isFavorite = false,
  });
}

final List<Product> products = [
   Product(
    name: 'Shoes',
    category: 'Footwear',
    price: 69.00,
    oldprice: 189.00,
    imageUrl: 'assets/images/shoe.jpg',
    description: 'This is a description of the product 1',
  ),
     Product(
    name: 'laptop',
    category: 'Electronics',
    price: 69.00,
    oldprice: 189.00,
    imageUrl: 'assets/images/laptop.jpg',
    description: 'This is a description of the product 2',
  ),
     Product(
    name: ' Jordan Shoes',
    category: 'Footwear',
    price: 69.00,
    oldprice: 189.00,
    imageUrl: 'assets/images/shoe2.jpg',
    description: 'This is a description of the product 3',
  ),
     Product(
    name: 'Puma',
    category: 'Footwear',
    price: 69.00,
    oldprice: 189.00,
    imageUrl: 'assets/images/shoes2.jpg',
    description: 'This is a description of the product 4',
  ),
];
