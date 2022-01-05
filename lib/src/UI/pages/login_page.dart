import 'package:flutter/material.dart';
import 'package:prueba/src/Backend/BaseDatos.dart';
import 'package:prueba/src/Backend/usuario_model.dart';
import 'package:prueba/src/UI/components/inputs.dart';

Widget TextoRedondo(var texto) {
  return Container(
    //width: 200,
    padding: const EdgeInsets.only(top: 30),
    child: TextField(
      decoration: InputDecoration(
          hintText: texto,
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
            borderSide: const BorderSide(),
          )),
    ),
  );
}

class Login extends StatelessWidget {
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
            error
                ? TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('ok',
                        style: TextStyle(
                          color: Colors.red,
                        )))
                : TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/catalogo');
                    },
                    child: const Text('ok',
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
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'email': 'unEmail@algo.com',
      'password': 'unPasword1234',
    };
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Ingresa a tu Cuenta'),
        backgroundColor: Colors.white60,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          key: myFormKey,
          child: Column(
            children: [
              InputForm(
                hintText: 'E-mail',
                formProperty: 'email',
                inputType: TextInputType.emailAddress,
                formValues: formValues,
              ),
              const SizedBox(
                height: 30,
              ),
              InputForm(
                hintText: 'Contraseña',
                isPassword: true,
                formProperty: 'password',
                formValues: formValues,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  //* Minimiza el teclado al hacer click en registrar
                  FocusScope.of(context).requestFocus(FocusScopeNode());
                  //* Valida los campos
                  if (!myFormKey.currentState!.validate()) return;
                  Usuario usuario = Usuario(
                      email: formValues['email'],
                      contrasena: formValues['password']);

                  //* Intenta guardar en la base de datos a los nuevos usuarios
                  List<Usuario>? respuesta = await Backend.getUsuarios();
                  bool bandera = false;
                  respuesta?.forEach((element) {
                    if (element.contrasena == usuario.contrasena &&
                        element.email == usuario.email) bandera = true;
                  });

                  if (bandera) {
                    Navigator.popAndPushNamed(context, '/catalogo');
                  } else {
                    alert(context, 'Usuario no encontrado', 'Error', true);
                  }
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Ingresar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
