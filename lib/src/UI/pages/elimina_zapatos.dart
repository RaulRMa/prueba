import 'package:flutter/material.dart';
import 'package:prueba/src/Backend/BaseDatos.dart';
import 'package:prueba/src/Backend/usuario_model.dart';

class EliminaZapatos extends StatefulWidget {
  const EliminaZapatos({Key? key}) : super(key: key);

  @override
  State<EliminaZapatos> createState() => _EliminaZapatosState();
}

class _EliminaZapatosState extends State<EliminaZapatos> {
  double iconSize = 40;
  List<Usuario>? usuarios;

  Future showAlert(BuildContext context, Usuario user) async {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: const Text('Editar o eliminar'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Editar o eliminar un usuario'),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Editar',
                  style: TextStyle(color: Colors.red),
                )),
            TextButton(
                onPressed: () async {
                  await Backend.deleteUser(user);
                  Navigator.pop(context);
                  setState(() {});
                },
                child: const Text(
                  'Eliminar',
                  style: TextStyle(color: Colors.red),
                ))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Backend.getUsuarios(),
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
            usuarios = snapshot.data as List<Usuario>?;
            if (usuarios!.isNotEmpty) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Usuarios'),
                ),
                body: ListView.separated(
                  itemCount: usuarios!.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(usuarios![index].email ?? ''),
                    onTap: () {
                      showAlert(context, usuarios![index]);
                    },
                  ),
                  separatorBuilder: (_, __) => const Divider(),
                ),
              );
            }
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
