import 'package:flutter/material.dart';
import 'package:prueba/src/Backend/BaseDatos.dart';
import 'package:prueba/src/Backend/Producto_model.dart';
import 'package:prueba/src/UI/constants.dart';

class EliminaZapatos extends StatelessWidget {
  EliminaZapatos({Key? key}) : super(key: key);
  double iconSize = 40;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Backend.productos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occured',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasData) {
            print("Cambiando de pantalla");
            List<Producto>? productos = snapshot.data as List<Producto>?;
            if (productos!.isNotEmpty) {
              return Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Table(),
              ));
            }
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text("Eliminar producto"),
                backgroundColor: productColor,
              ),
              body: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(children: [
                          Column(children: [
                            Icon(
                              Icons.account_box,
                              size: iconSize,
                            ),
                            Text('Nombre')
                          ]),
                          Column(children: [
                            Icon(
                              Icons.settings,
                              size: iconSize,
                            ),
                            Text('imagen')
                          ]),
                          Column(children: [
                            Icon(
                              Icons.lightbulb_outline,
                              size: iconSize,
                            ),
                            Text('Precio')
                          ]),
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
