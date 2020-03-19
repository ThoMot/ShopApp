import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';

enum FilterOptions { Favorites, All }

class ProductsOverview extends StatefulWidget {
  @override
  _ProductsOverviewState createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  var showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ThorasShop"),
        actions: <Widget>[
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    showOnlyFavorites = true;
                  } else {
                    showOnlyFavorites = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("Only Favorites bish"),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text("Show All"),
                      value: FilterOptions.All,
                    )
                  ]),
          Consumer<Cart>(
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {},
            ),
            builder: (_, cartData, child) =>
                Badge(child: child, value: cartData.itemCount.toString()),
          ),
        ],
      ),
      body: ProductsGrid(showOnlyFavorites),
    );
  }
}
