import 'package:flutter/cupertino.dart';
import 'package:provider_mobile/providers/cart.dart';

class OrderItemM {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItemM({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders extends ChangeNotifier {
  final List<OrderItemM> _orders = [];
  List<OrderItemM> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItemM(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
