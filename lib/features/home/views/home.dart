import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../data/models/category_model.dart';
import '../widgets/custom_category_list.dart';
import '../widgets/custom_product_card.dart';
import '../widgets/custom_search.dart';
import '../widgets/custom_stylish.dart';
import '../data/models/products_model.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<Product> products = [
    Product(
      imageUrl: AppAssets.tShirt,
      name: "Mens Starry",
      description: "Mens Starry Sky Printed Shirt\n100% Cotton Fabric",
      price: "T399",
      rating: "★★★★☆ 132,344",
    ),
    Product(
      imageUrl: AppAssets.tShirt,
      name: "Mens Starry",
      description: "Mens Starry Sky Printed Shirt\n100% Cotton Fabric",
      price: "T399",
      rating: "★★★★☆ 132,344",
    ),
    Product(
      imageUrl: AppAssets.tShirt,
      name: "Mens Starry",
      description: "Mens Starry Sky Printed Shirt\n100% Cotton Fabric",
      price: "T399",
      rating: "★★★★☆ 132,344",
    ),
    Product(
      imageUrl: AppAssets.tShirt,
      name: "Mens Starry",
      description: "Mens Starry Sky Printed Shirt\n100% Cotton Fabric",
      price: "T399",
      rating: "★★★★☆ 132,344",
    ),
    Product(
      imageUrl: AppAssets.tShirt,
      name: "Mens Starry",
      description: "Mens Starry Sky Printed Shirt\n100% Cotton Fabric",
      price: "T399",
      rating: "★★★★☆ 132,344",
    ),
    Product(
      imageUrl: AppAssets.tShirt,
      name: "Mens Starry",
      description: "Mens Starry Sky Printed Shirt\n100% Cotton Fabric",
      price: "T399",
      rating: "★★★★☆ 132,344",
    ),
  ];
  final List<Category> categories = [
    Category(name: "Men", iconPath: "assets/icons/men.svg"),
    Category(name: "Women", iconPath: "assets/icons/women.svg"),
    Category(name: "Kids", iconPath: "assets/icons/kids.svg"),
    Category(name: "Shoes", iconPath: "assets/icons/shoes.svg"),
    Category(name: "Men", iconPath: "assets/icons/men.svg"),
    Category(name: "Women", iconPath: "assets/icons/women.svg"),
    Category(name: "Kids", iconPath: "assets/icons/kids.svg"),
    Category(name: "Shoes", iconPath: "assets/icons/shoes.svg"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomStylish(),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search any product',
                hintStyle: TextStyle(
                  color: AppColors.textFormSearch,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(Icons.search, color: AppColors.textFormSearch),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
              ),
              onTap: () {
                showSearch(context: context, delegate: CustomSearch());
              },
            ),
            SizedBox(height: 17),
            Align(
              alignment: Alignment.topLeft,
              child: Text('All Featured', style: TextStyle(
                fontFamily: 'montserrat',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
            ),
            SizedBox(height: 17),
            CategoriesList(categories: categories),
            SizedBox(height: 16,),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Products', style: TextStyle(
                fontFamily: 'montserrat',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
            ),

            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index], imageUrl: AppAssets.tShirt);
                  }, gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 163 / 305,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}