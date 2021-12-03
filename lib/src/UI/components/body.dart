import 'package:flutter/material.dart';
import 'package:prueba/src/UI/constants.dart';
import 'categorias.dart';
import '../../Backend/BaseDatos.dart';
import '../../Backend/Producto_model.dart';

class Body extends StatelessWidget {
  var lista_productos = null;

  get_productos() async {
    lista_productos = await Backend.productos();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Dama",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categoria(),
        FutureBuilder<List<Producto>>(
          future: Backend.productos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If we got an error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occured',
                    style: TextStyle(fontSize: 18),
                  ),
                );

                // if we got our data
              } else if (snapshot.hasData) {
                List<Producto>? productos = snapshot.data;
                String unProducto = productos![0].name;
                return Center(
                  child: Text(
                    '$unProducto',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }
}

class ItemProducto extends StatelessWidget {
  const ItemProducto() : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(kDefaultPadding),
          height: 100,
          width: 160,
          decoration: BoxDecoration(
            color: productColor,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
          child: Text(
            "Un título chido",
            style: TextStyle(color: kTextColor),
          ),
        ),
        Text(
          "\$234",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
