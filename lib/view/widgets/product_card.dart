import 'package:flutter/material.dart';
import 'package:flutter_proj/models/product.dart';
import 'package:flutter_proj/utils/app_textstyles.dart';
class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Image
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    widget.product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Favorite button
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite
                        ? Colors.red 
                        : (isDark ? Colors.grey[400] : Colors.grey),
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                      widget.product.isFavorite = isFavorite;
                    });
                    
                  },
                ),
              ),
              // Discount badge
              if (widget.product.oldprice != null)
                Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${calculateDiscount(widget.product.price, widget.product.oldprice!)}% OFF',
                      style: AppTextstyles.withColor(
                        AppTextstyles.withWeight(
                          AppTextstyles.bodysmall,
                          FontWeight.bold,
                        ),
                        Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // Product details
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: AppTextstyles.withColor(
                    AppTextstyles.withWeight(AppTextstyles.h3, FontWeight.bold),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  widget.product.category,
                  style: AppTextstyles.withColor(
                    AppTextstyles.bodyMedium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Row(
                  children: [
                    Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: AppTextstyles.withColor(
                        AppTextstyles.withWeight(
                          AppTextstyles.bodylarge,
                          FontWeight.bold,
                        ),
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    if (widget.product.oldprice != null) ...[
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        '\$${widget.product.oldprice!.toStringAsFixed(2)}',
                        style: AppTextstyles.withColor(
                          AppTextstyles.bodysmall,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ).copyWith(decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Calculate discount
  int calculateDiscount(double currentPrice, double oldPrice) {
    return (((oldPrice - currentPrice) / oldPrice) * 100).round();
  }
}
