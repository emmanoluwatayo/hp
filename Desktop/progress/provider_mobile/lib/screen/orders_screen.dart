import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mobile/providers/providers.dart';
import 'package:provider_mobile/widgets/widgets.dart';

class OrderScreen extends StatelessWidget {
  static const routName = '/orders';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Order"),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: ((context, index) => OrderItem(ordersData.orders[index])),
      ),
    );
  }
}
