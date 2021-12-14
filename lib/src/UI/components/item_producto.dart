import 'package:flutter/material.dart';
import 'package:prueba/src/Backend/Producto_model.dart';
import 'package:prueba/src/UI/constants.dart';

class ItemProducto extends StatelessWidget {
  final Producto producto_item;
  final VoidCallback presionado;

  const ItemProducto({required this.producto_item, required this.presionado})
      : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: presionado,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                // height: 100,
                // width: 160,
                decoration: BoxDecoration(
                  color: productColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Hero(
                  tag: Object(),
                  child: Image.network(producto_item.imagen),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              producto_item.nombre,
              style: const TextStyle(color: kTextColor),
            ),
          ),
          Text(
            "\$ ${producto_item.precio} ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
