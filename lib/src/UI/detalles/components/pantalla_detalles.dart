import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prueba/src/Backend/BaseDatos.dart';
import 'package:prueba/src/Backend/Producto_model.dart';
import 'package:prueba/src/UI/constants.dart';
import 'package:prueba/src/UI/detalles/components/body.dart';

class PantallaDetalles extends StatelessWidget {
  final Producto producto;
  final icon_path = 'lib/src/assets/icons/';

  const PantallaDetalles({Key? key, required this.producto}) : super(key: key);
  void alert(BuildContext context, String mensaje, String titulo, bool error) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: Text(titulo),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              error ? const Icon(Icons.error) : const Icon(Icons.done),
              const SizedBox(
                height: 20,
              ),
              Text(mensaje),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  await Backend.delete(producto);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('Ok',
                    style: TextStyle(
                      color: Colors.red,
                    ))),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar',
                    style: TextStyle(
                      color: Colors.red,
                    ))),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: productColor,
      appBar: buildAppBar(context),
      body: Body(
        producto: producto,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.edit),
          ),
          const SizedBox(
            width: 25,
          ),
          FloatingActionButton(
            onPressed: () {
              alert(context, "¿Desea borrar el elemento?", 'Eliminar', true);
            },
            child: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: productColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(icon_path + "back.svg", color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(icon_path + "search.svg")),
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(icon_path + "cart.svg")),
        const SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}
