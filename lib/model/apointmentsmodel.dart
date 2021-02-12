import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'apointcartmodel.dart';


class ApointmentItem {
  final String id;
  final double amount;
  final List<CartItem> students;
  final DateTime dateTime;

  ApointmentItem({
    @required this.id,
    @required this.amount,
    @required this.students,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<ApointmentItem> orders = [];

  List<ApointmentItem> get order{
    return [...orders];
  }

  Future<void> addOrder(List<CartItem> cartstudents,double total)async{
    final url= 'https://shoppibg-tube.firebaseio.com/orders.json';
    final timeStamp = DateTime.now();
    try{
      final response = await http.post(url, body:json.encode({
        'id': DateTime.now().toString(),
        'amount': total,
        'dateTime': timeStamp.toIso8601String(),
        'students': cartstudents.map((cp) => {
          'id':cp.id,
          'title':cp.name,
          'day': cp.day,
          'time': cp.time,
        }).toList(),
      }));
      orders.insert(0, ApointmentItem(
        id:json.decode(response.body)['name'],
        amount: total,
        dateTime: timeStamp,
        students: cartstudents
      ));
      notifyListeners();
    }catch(err) {
      throw err;
    }
  }

}