import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutionapp/appntItem.dart';
import 'package:tutionapp/eventcalendar.dart';
import 'package:tutionapp/model/apointcartmodel.dart';

import 'model/apointmentsmodel.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('My Appointments',
              style: TextStyle(
                  fontSize: 30, color: Theme.of(context).accentColor))),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, i) => CartPdt(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].time,
                cart.items.values.toList()[i].day,
                cart.items.values.toList()[i].name,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.black, size: 30),
            // onPressed: ()=>Navigator.of(context).pushNamed(CartScreen.routeName))
            onPressed: (){
              
            Navigator.pushNamed(context, '/calendar');}
          ),

          CheckoutButton(cart: cart),
          // FlatButton(
          //   onPressed: (){

          //   },
          // child:
          // Text('Checkout',
          // style: TextStyle(color: Colors.blue, fontSize: 20),))
        ],
      ),
    );
   
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;

  const CheckoutButton({@required this.cart});

  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Checkout'),
      onPressed: widget.cart.totalAmount <= 0
          ? null
          : () async {
              await Provider.of<Orders>(context, listen: false).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount,
              );
              widget.cart.clear();
            },
    );
  }
}
