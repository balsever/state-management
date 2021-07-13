import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementexample/providers/orders.dart';
import 'package:statemanagementexample/widgets/app_darawer.dart';
import 'package:statemanagementexample/widgets/order_item.dart' as ord;

class OrdersScreen extends StatelessWidget {
static const routeName= '/orders'  ;

  @override
  Widget build(BuildContext context) {
      final orderData= Provider.of<Orders>(context);

    return Scaffold(appBar: AppBar(title: Text("Your Orders"),),
    drawer: AppDrawer(),
    
    body: ListView.builder(
      itemCount: orderData.orders.length,
       itemBuilder: ( ctx, i) =>ord.OrderItem(orderData.orders[i]),)
    );
  }
}