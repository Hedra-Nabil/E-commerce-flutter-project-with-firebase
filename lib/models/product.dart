class Product {
  final String name;
  final String category;
  final double price;
  final double? oldprice;
  final String imageUrl;
  final bool isFavorite;
  final String description;

  const Product({
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
  const Product(
    name: 'Shoes',
    category: 'Footwear',
    price: 69.00,
    oldprice: 189.00,
    imageUrl: 'assets/images/shoe.jpg',
    description: 'This is a description of the product 1',
  ),
    const Product(
    name: 'laptop',
    category: 'Electronics',
    price: 69.00,
    oldprice: 189.00,
    imageUrl: 'assets/images/laptop.jpg',
    description: 'This is a description of the product 2',
  ),
    const Product(
    name: ' Jordan Shoes',
    category: 'Footwear',
    price: 69.00,
    oldprice: 189.00,
    imageUrl: 'assets/images/shoe2.jpg',
    description: 'This is a description of the product 3',
  ),
    const Product(
    name: 'Puma',
    category: 'Footwear',
    price: 69.00,
    oldprice: 189.00,
    imageUrl: 'assets/images/shoes2.jpg',
    description: 'This is a description of the product 4',
  ),
];
