
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/orders.dart';
import 'package:shopapp/widgets/order_item.dart';

import '../widgets/appDrawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeNamed = '/orders';

  @override
  Widget build(BuildContext context) {
    
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i)=> OrderItems(orderData.orders[i])),
    );
  }
}