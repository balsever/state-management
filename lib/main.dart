import 'package:flutter/material.dart';
import 'package:statemanagementexample/providers/cart.dart';
import 'package:statemanagementexample/providers/orders.dart';
import 'package:statemanagementexample/screens/cart_screen.dart';
import 'package:statemanagementexample/screens/orders_screen.dart';
import 'package:statemanagementexample/screens/product_detail.dart';
import 'package:statemanagementexample/screens/products_overview_screen.dart';
import './providers/products_provider.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
      create: (ctx)=> Products(),
            ),
            ChangeNotifierProvider(
      create: (ctx)=> Cart(),
            ),
            ChangeNotifierProvider(
              create:(ctx)=>Orders() ,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projem',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.orange
        ),
        home: ProducstsOverviewScreen(),
        routes: {
          ProductDetail.routeName: (ctx)=> ProductDetail(),
          CartScreen.routeName: (ctx)=> CartScreen(),
          OrdersScreen.routeName:(ctx)=>OrdersScreen()
          
          }
      ),
    );
  }
}

