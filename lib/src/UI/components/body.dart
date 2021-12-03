import 'package:flutter/material.dart';
import 'package:prueba/src/UI/constants.dart';
import 'package:prueba/src/UI/detalles/components/pantalla_detalles.dart';
import 'categorias.dart';
import '../../Backend/BaseDatos.dart';
import '../../Backend/Producto_model.dart';
import 'item_producto.dart';

class Body extends StatelessWidget {
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
        const Categoria(),
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
                return Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: GridView.builder(
                      itemCount: productos!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPadding,
                        crossAxisSpacing: kDefaultPadding,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => ItemProducto(
                        producto_item: productos[index],
                        presionado: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PantallaDetalles(
                                    producto: productos[index]))),
                      ),
                    ),
                  ),
                );
                // return ItemProducto(
                //     nombre_producto: unProducto.name, precio: unProducto.price);
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }
}
