
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutionapp/model/apointcartmodel.dart';


class CartPdt extends StatelessWidget {
  final String id;
  final String productId;
  final double time;
  final int day;
  final String name;

  CartPdt(this.id, this.productId, this.time, this.day, this.name);

    @override
    Widget build(BuildContext context) {
      return Dismissible(
        key: ValueKey(id),
        direction: DismissDirection.endToStart,
        background: Container(
          color:Colors.red,
        ),
        onDismissed: (direction){
          Provider.of<Cart>(context).removeItem(productId);
        },
              child: Card(
          child: ListTile(
            leading: CircleAvatar(
              child:FittedBox(child: Text('\Sh$time'),)
            ),
            title:Text(name),
            subtitle: Text('Total:\Sh${(time*day)}'),
            trailing: Text('$day x'),
          ),
          
        ),
      );
    }
}