import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import "../screens/product_details_screen.dart";
import '../providers/product.dart';
import "../providers/cart.dart";

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    //final prod = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return Consumer<Product>(
      builder: (ctx, prod, child) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetails.routeName, arguments: prod.id);
            },
            child: Image.network(
              prod.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
              leading: IconButton(
                icon: Icon(
                    prod.isFavorite ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  prod.toggleFavoriteStatus();
                },
                color: Theme.of(context).accentColor,
              ),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  cart.addItem(prod.id, prod.price, prod.title);
                },
                color: Theme.of(context).accentColor,
              ),
              backgroundColor: Colors.black54,
              title: Text(
                prod.title,
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }
}
