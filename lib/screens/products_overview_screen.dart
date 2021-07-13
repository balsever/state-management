import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementexample/providers/cart.dart';
import 'package:statemanagementexample/providers/products.dart';
import 'package:statemanagementexample/providers/products_provider.dart';
import 'package:statemanagementexample/screens/cart_screen.dart';
import 'package:statemanagementexample/widgets/app_darawer.dart';
import 'package:statemanagementexample/widgets/products_grid.dart';
import 'package:statemanagementexample/widgets/product_item.dart';
import '../widgets/badge.dart';

enum FilterOptions{
  Favorites,
  All
}

class ProducstsOverviewScreen extends StatefulWidget {


  @override
  _ProducstsOverviewScreenState createState() => _ProducstsOverviewScreenState();
}

class _ProducstsOverviewScreenState extends State<ProducstsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) { 
    //final cart= Provider.of<Cart>(context);
     //final productsContainer = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
      actions: [
        PopupMenuButton(
          onSelected: (FilterOptions selectedValue){
            setState(() {
               if(selectedValue== FilterOptions.Favorites){
                     //productsContainer.showFavoritesOnly();
                     _showOnlyFavorites= true;
            }else{
                         //productsContainer.showAll();
                         _showOnlyFavorites= false;
            }
            });         
          },
          icon: Icon(Icons.more_vert),          
          
          itemBuilder:(_)=>[
        PopupMenuItem(
          child: Text("only Favorites"),
           value: FilterOptions.Favorites),
        PopupMenuItem(
          child: Text("Show All"), 
          value: FilterOptions.All,
        ),
      ],
      ),
       Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                  child:Container(child: ch,),
                  value: cart.itemCount.toString(),
                ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,),
      onPressed: (){
        Navigator.of(context).pushNamed(CartScreen.routeName
        );      },
      ),
      ),
      ],
      ),
       drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}