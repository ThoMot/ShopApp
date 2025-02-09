import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductDetails extends StatelessWidget {
  //final String title;

  //ProductDetails({this.title});
  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
        appBar: AppBar(
            title: Text(
      loadedProduct.title,
    )));
  }
}
