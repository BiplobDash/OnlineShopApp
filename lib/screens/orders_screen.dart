
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/orders.dart';
import 'package:shopapp/widgets/order_item.dart';

import '../widgets/appDrawer.dart';

class OrdersScreen extends StatefulWidget {
  static const routeNamed = '/orders';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  late Future _ordersFuture;
  Future _obtainsOrderFuture(){
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    // TODO: implement initState
    _ordersFuture = _obtainsOrderFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      drawer: AppDrawer(),
      body: FutureBuilder(future: _ordersFuture, builder: (ctx, dataSnapShot){
        if(dataSnapShot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else{
          if(dataSnapShot.error != null ){
            // Do error handaling start
            return Center(child: Text('An error Occured!'),);
          }
          else{
              return Consumer<Orders>(builder: (ctx, orderData,child)=> ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i)=> OrderItems(orderData.orders[i])));
          }
        }
      },)
    );
  }
}