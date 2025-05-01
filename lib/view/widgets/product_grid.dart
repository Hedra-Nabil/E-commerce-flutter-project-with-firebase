import 'package:flutter/material.dart';
import 'package:flutter_proj/models/product.dart';
import 'package:flutter_proj/view/product_details.dart';
import 'package:flutter_proj/view/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetialsScreen(product: product),
                ),
              ),
          child: ProductCard(product: product),
        );
      },
    );
  }
}
