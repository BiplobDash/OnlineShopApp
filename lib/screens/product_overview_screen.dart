import 'package:flutter/material.dart';
import 'package:shopapp/widgets/products_grid.dart';


enum filterOptions { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
              onSelected: (filterOptions selectedValue) {
                setState(() {
                  if (selectedValue == filterOptions.Favorites) {
                    _showFavorites = true;
                  } else {
                    _showFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: filterOptions.Favorites),
                    PopupMenuItem(
                        child: Text('Show All'), value: filterOptions.All)
                  ])
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ProductsGrid(_showFavorites),
    );
  }
}
