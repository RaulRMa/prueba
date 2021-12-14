import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:prueba/src/Backend/BaseDatos.dart';
import 'package:prueba/src/Backend/Producto_model.dart';
import 'package:prueba/src/UI/constants.dart';
import 'package:prueba/src/UI/pages/home_page.dart';

class RegistraProducto extends StatelessWidget {
  RegistraProducto({Key? key}) : super(key: key);

  final precio = TextEditingController();
  final descripcion = TextEditingController();
  final nombre = TextEditingController();

  final imagen = TextEditingController();

  submit(context) {
    if (precio.text.isEmpty ||
        descripcion.text.isEmpty ||
        nombre.text.isEmpty ||
        imagen.text.isEmpty) {
      print("Debe llenar todos los campos");
    } else {
      Producto producto = Producto(
          descripcion: descripcion.text,
          imagen: imagen.text,
          nombre: nombre.text,
          precio: int.parse(precio.text));

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FutureBuilder(
                  future: Backend.insert(producto),
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
                        Backend.getUsuarios();
                        Navigator.popAndPushNamed(context, '/catalogo');
                      }
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Agregar producto"),
        backgroundColor: productColor,
      ),
      body: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: TextoRedondo('Nombre', nombre),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: TextoRedondo('Precio', precio),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: TextoRedondo('Descripcion', descripcion),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: TextoRedondo('Link de imagen', imagen),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: TextButton(
                onPressed: () => {submit(context)},
                child: const Text("Guardar",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: productColor),
              ),
            )
          ])
        ],
      ),
    );
  }
}

Widget TextoRedondo(var texto, TextEditingController controlador) {
  return Container(
    //width: 200,
    padding: EdgeInsets.only(top: 30),
    child: TextField(
      controller: controlador,
      decoration: InputDecoration(
          hintText: texto,
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(28.0),
            borderSide: new BorderSide(),
          )),
    ),
  );
}
