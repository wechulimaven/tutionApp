import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final int day;
  final double time;

  CartItem(
      {@required this.name,
      @required this.id,
      @required this.day,
      @required this.time});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> items = {};

  Map<String, CartItem> get item {
    return {...items};
  }

  int get itemCount {
    return items.length;
  }

  void additem(String pdtid, String name, double time) {
    if (items.containsKey(pdtid)) {
      items.update(
          pdtid,
          (existingCartItem) => CartItem(
              name: existingCartItem.name,
              id: DateTime.now().toString(),
              day: existingCartItem.day + 1,
              time: existingCartItem.time));
    } else {
      items.putIfAbsent(
          pdtid,
          () => CartItem(
              id: DateTime.now().toString(), name: name, day: 1, time: time));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!items.containsKey(id)) {
      return;
    }
    if (items[id].day > 1) {
      items.update(
          id,
          (existingCartItem) => CartItem(
              name: existingCartItem.name,
              id: DateTime.now().toString(),
              day: existingCartItem.day - 1,
              time: existingCartItem.time));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    items.forEach((key, cartItem) {
      total += cartItem.time * cartItem.day;
    });
    return total;
  }

  void clear() {
    items = {};
    notifyListeners();
  }
}
