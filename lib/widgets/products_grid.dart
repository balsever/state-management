 import 'package:flutter/material.dart';
import 'package:statemanagementexample/providers/products_provider.dart';
import 'package:statemanagementexample/widgets/product_item.dart';
import 'package:provider/provider.dart';
class ProductsGrid extends StatelessWidget {
  final bool showFavs;
    ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
  

  final productsData= Provider.of<Products>(context);
  final products= showFavs? productsData.favoriteItems: productsData.items; // tüm ürünlere erişim sağladık
  print("heyyyyyyyyyyyyy");
  print(productsData);
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        childAspectRatio: 3/2, 
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10),
      itemCount: products.length,
       itemBuilder:  (ctx, i)=>ChangeNotifierProvider.value(value: products[i],
         //create: (c) => products[i],
       child:ProductItem(
         /* products[i].id,
         products[i].title,
          products[i].imageUrl */),)
       
       );
  }
}
