import 'package:flutter/material.dart';
import 'package:flutter_proj/utils/app_textstyles.dart';
import 'package:flutter_proj/view/help%20center/view/widgets/category_card.dart';

class HelpCategoriesSection extends StatelessWidget {
   const HelpCategoriesSection({super.key});
 
   @override
   Widget build(BuildContext context) {
     final categories = [
       {'icon' : Icons.shopping_cart_checkout_outlined, 'title' : 'Orders '},
       {'icon' : Icons.payment_outlined , 'title' : 'Payments '},
       {'icon' : Icons.local_shipping_outlined, 'title' : 'Shipping '},
       {'icon' : Icons.assignment_return_outlined, 'title' : 'Returns '},
     ];
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             'Help Categories',
             style: AppTextstyles.withColor(
               AppTextstyles.h3,
               Theme.of(context).textTheme.bodyLarge!.color!,
             ),
           ),
           const SizedBox(height: 16),
           GridView.builder(
             shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing: 16,
                 mainAxisSpacing: 16,
                 childAspectRatio: 1.5,
               ),
             itemCount: categories.length,
             itemBuilder: (context, index){
                 return CategoryCard(
                   title: categories[index]['title'] as String,
                   icon: categories[index]['icon'] as IconData,
                 );
             }
           ),
         ],
       ),
     );
   }
 }