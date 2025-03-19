import 'package:flutter/material.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/home/ui/widgets/all_product/product_item.dart';

class SearchProductsGridView extends StatelessWidget {
  const SearchProductsGridView({super.key, required this.productList});
  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.productDetailScreen,
                      arguments: productList[index]);
                },
                child: ProductItems(
                  product: productList[index],
                ));
          }),
    );
  }
}
