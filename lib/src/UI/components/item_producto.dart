import 'package:flutter/material.dart';
import 'package:prueba/src/Backend/Producto_model.dart';
import 'package:prueba/src/UI/constants.dart';

class ItemProducto extends StatelessWidget {
  final Producto producto_item;

  const ItemProducto({required this.producto_item}) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(kDefaultPadding),
            // height: 100,
            // width: 160,
            decoration: BoxDecoration(
              color: productColor,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
          child: Text(
            "${producto_item.name}",
            style: TextStyle(color: kTextColor),
          ),
        ),
        Text(
          "\$ ${producto_item.price} ",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
