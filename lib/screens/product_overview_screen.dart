import 'package:flutter/material.dart';
import 'package:shopapp/widgets/product_item.dart';
import 'package:shopapp/widgets/products_grid.dart';

import '../models/product.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ProductsGrid(),
    );
  }
}
