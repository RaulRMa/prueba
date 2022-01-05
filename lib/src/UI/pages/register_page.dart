import 'package:flutter/material.dart';
import 'package:prueba/src/Backend/BaseDatos.dart';
import 'package:prueba/src/Backend/usuario_model.dart';
import 'package:prueba/src/UI/components/inputs.dart';

class Registrar extends StatelessWidget {
  final email = TextEditingController();
  final contrasena = TextEditingController();
  final contrasena2 = TextEditingController();

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
    final TextEditingController pass1 = TextEditingController();
    final TextEditingController pass2 = TextEditingController();

    final Map<String, String> formValues = {
      'email': 'unEmail@algo.com',
      'password': 'unPasword1234',
    };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Registra tus datos'),
        backgroundColor: Colors.white60,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: myFormKey,
            child: Column(
              children: <Widget>[
                InputForm(
                  hintText: 'E-mail',
                  formValues: formValues,
                  formProperty: 'email',
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 30,
                ),
                InputForm(
                  hintText: 'Contraseña',
                  isPassword: true,
                  formProperty: 'password',
                  formValues: formValues,
                  controller: pass1,
                  rePassword: pass2.text,
                ),
                const SizedBox(
                  height: 30,
                ),
                InputForm(
                    hintText: 'Repita su contraseña',
                    isPassword: true,
                    formProperty: '',
                    formValues: null,
                    controller: pass2,
                    rePassword: pass1.text),
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
                    int respuesta = await Backend.inserta_usuario(usuario);
                    if (respuesta == 0) {
                      alert(context, 'Hubo un error al registrarse', 'Error',
                          true);
                    } else {
                      alert(context, 'Usuario registrado con éxito', 'Correcto',
                          false);
                    }
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('Registrar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
