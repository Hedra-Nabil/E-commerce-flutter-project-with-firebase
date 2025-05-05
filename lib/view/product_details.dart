//Nagham
import 'package:flutter/material.dart';
import 'package:flutter_proj/models/product.dart';
import 'package:flutter_proj/utils/app_textstyles.dart';
import 'package:share_plus/share_plus.dart';
import 'Widgets/size_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Details',
          style: AppTextstyles.withColor(AppTextstyles.h2,
              isDark ? Colors.white : Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () => _shareProduct(
              context,
              widget.product.name,
              widget.product.description,
            ),
            icon: Icon(Icons.share,
              color: isDark ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16/9,
                  child: Image.asset(widget.product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                        widget.product.isFavorite = isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? Colors.red 
                          : (isDark ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth*0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.name,
                          style: AppTextstyles.withColor(AppTextstyles.h2,
                              Theme.of(context).textTheme.headlineMedium!.color!),
                        ),
                      ),
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style: AppTextstyles.withColor(AppTextstyles.h2,
                            Theme.of(context).textTheme.headlineMedium!.color!),
                      ),
                    ],
                  ),
                  Text(
                    widget.product.category,
                    style: AppTextstyles.withColor(AppTextstyles.bodyMedium,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!),
                  ),
                  SizedBox(height: screenHeight*0.02),
                  Text(
                    'Select size',
                    style: AppTextstyles.withColor(AppTextstyles.labelMeduim,
                        Theme.of(context).textTheme.bodyLarge!.color!),
                  ),
                  SizedBox(height: screenHeight*0.01),
                  const SizeSelector(),
                  SizedBox(height: screenHeight*0.02),
                  Text(
                    'Description',
                    style: AppTextstyles.withColor(AppTextstyles.labelMeduim,
                        Theme.of(context).textTheme.bodyLarge!.color!),
                  ),
                  SizedBox(height: screenHeight*0.01),
                  Text(
                    widget.product.description,
                    style: AppTextstyles.withColor(AppTextstyles.bodysmall,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth*0.04),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight*0.02,
                    ),
                    side: BorderSide(
                      color: isDark ? Colors.white70 : Colors.black12,
                    ),
                  ),
                  child: Text('Add To Cart',
                    style: AppTextstyles.withColor(AppTextstyles.buttonMeduim,
                        Theme.of(context).textTheme.bodyLarge!.color!),
                  ),
                ),
              ),
              SizedBox(width: screenWidth*0.04),
              Expanded(
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight*0.02,
                      ),
                      backgroundColor: Theme.of(context).primaryColor
                  ),
                  child: Text('Buy Now',
                    style: AppTextstyles.withColor(AppTextstyles.buttonMeduim,
                        Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _shareProduct(
      BuildContext context,
      String productName,
      String description,
      ) async {
    final box = context.findRenderObject() as RenderBox?;
    const String shopLink = 'https://shop.com/product/cotton-tshirt';
    final String shareMessage = '$description\n\nShop now at $shopLink';
    try {
      final ShareResult result = await Share.share(
        shareMessage,
        subject: productName,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
      if (result.status == ShareResultStatus.success) {
        debugPrint('Thank you for sharing!');
      }
    } catch (e) {
      debugPrint('Error Sharing: $e');
    }
  }
}
