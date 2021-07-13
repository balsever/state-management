import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementexample/providers/products_provider.dart';
import 'package:statemanagementexample/widgets/app_darawer.dart';

class ProductDetail extends StatelessWidget {
/*   final String title;

ProductDetail(this.title); */
  static const routeName = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // bu id ?
    //var loadedProduct= Provider.of<Products>(context).items.firstWhere((element) => element.id== productId);//provider kullanarak Product listemize ulaştık.
    //ilk yöntem
    var loadedProduct = Provider.of<Products>(context, listen: false)
        .findById(productId); //merkezde kullandıgımız fonksiyona ulaştık

    return Scaffold(
        appBar: AppBar(
          title: Text(loadedProduct.title),
        ),
       
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10,),
            Text(loadedProduct.price.toString(),style: TextStyle(color: Colors.grey,fontSize: 20)),
            SizedBox(height: 10,),
            Text(loadedProduct.description, textAlign: TextAlign.center,softWrap: true,)
          ],
        ),
        );
  }
}
