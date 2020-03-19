import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app/screens/product_details_screen.dart';
import './screens/products_overview_screen.dart';
import "./providers/products_provider.dart";
import "./providers/cart.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        )
      ],
      child: MaterialApp(
          title: "ShoppingApp",
          theme: ThemeData(
              fontFamily: "Lato",
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange),
          home: ProductsOverview(),
          routes: {ProductDetails.routeName: (ctx) => ProductDetails()}),
    );
  }
}
