import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementexample/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String ProductId;
  final double price;
  final int quantity;
  final String title;

   CartItem(this.id, this.ProductId, this.price, this.quantity, this.title);
  

  @override
  Widget build(BuildContext context) {
    final producRemove=Provider.of<Cart>(context, listen: true);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete,
        color: Colors.white,
        size: 40,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin:EdgeInsets.symmetric
        (horizontal: 15, vertical: 4),
        ),direction: DismissDirection.endToStart,
        onDismissed: (direction){
          producRemove.removeItem(ProductId);
        },
      child: Card(
        margin: EdgeInsets.symmetric
        (horizontal: 15, vertical: 4),
      child: Padding(padding: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(child: Text('\$price'),),
        title: Text(title),
        subtitle: Text('Total :\$${(price * quantity)}'),
        trailing: Text('$quantity'),
      ),),
      ),
    );

  }
}