import 'package:flutter/material.dart';
import 'package:prueba/src/Backend/BaseDatos.dart';
import 'package:prueba/src/Backend/usuario_model.dart';
import 'package:prueba/src/UI/pages/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registrar extends StatelessWidget {
  final email = TextEditingController();
  final contrasena = TextEditingController();
  final contrasena2 = TextEditingController();

  submit(context) async {
    if (email.text == "" || contrasena.text == "" || contrasena2.text == "") {
      print("Debe llenar todos los campos");
      // try {
      //   Fluttertoast.showToast(
      //       msg: "Debe llenar todos los campos",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
      // } catch (e) {
      //   print(e);
      // }
    } else if (contrasena.text != contrasena2.text) {
      print("${email.text}, ${contrasena.text}");
    } else {
      Usuario user = Usuario(email: email.text, contrasena: contrasena.text);
      //int respuesta = await ;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FutureBuilder(
                    future: Backend.inserta_usuario(user),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error} occured',
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          print("Cambiando de pantalla");
                          Backend.getUsuarios();
                          return HomePage();
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Registra tus datos'),
        backgroundColor: Colors.white60,
      ),
      body: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: TextoRedondo('E-mail', email),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: TextoRedondo('Contraseña', contrasena),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: TextoRedondo('Repita su contraseña', contrasena2),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () => submit(context),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                color: Colors.white,
                child: const Center(
                  child: Text('Registrar'),
                ),
              ),
            ),
          ]),
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
          contentPadding: const EdgeInsets.all(8),
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
            borderSide: const BorderSide(),
          )),
    ),
  );
}
