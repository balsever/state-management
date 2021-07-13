import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementexample/providers/cart.dart';
import 'package:statemanagementexample/providers/products.dart';
import 'package:statemanagementexample/screens/product_detail.dart';

class ProductItem  extends StatelessWidget {
  /* final String id;
  final String title;
  final String imageUrl;

   ProductItem(this.id, this.title, this.imageUrl); */
  

  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context, listen: true);
    final cart= Provider.of<Cart>(context, listen:false);
    return  ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
    
        
    /* push(MaterialPageRoute(
              builder: (ctx)=>ProductDetail(title) */
        
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetail.routeName, arguments: product.id);
          },
          child: Image.network(product.imageUrl, fit: BoxFit.cover,
          
          ),
        ),footer: GridTileBar(
          trailing: IconButton(
            onPressed: (){
            cart.addItem(product.id, product.price, product.title);

          }, icon: Icon(Icons.shopping_cart)),
          leading: IconButton(
            icon: Icon(product.isFavorite? Icons.favorite: Icons.favorite_border,),
          color: Theme.of(context).accentColor,
          onPressed: (){
            product.toggleFavorite();
          },
          ),
          
          title: Text(product.title,textAlign: TextAlign.center,),),
      ),
    );
  }
}