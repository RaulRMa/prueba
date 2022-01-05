// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:prueba/src/UI/pages/add_product.dart';
import 'package:prueba/src/UI/pages/elimina_zapatos.dart';
import 'package:prueba/src/UI/pages/home_page.dart';
import 'package:prueba/src/UI/pages/login_page.dart';
import 'package:prueba/src/UI/pages/register_page.dart';
import './constants.dart';
import '../UI/pages/menu_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'StepLife Zapatería';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const Center(
      //   // child: HomePage(),
      //   child: FirstHome(title: appTitle),
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstHome(title: appTitle),
        '/Login': (context) => Login(),
        '/Registrar': (context) => Registrar(),
        '/catalogo': (context) => HomePage(),
        '/registrarProd': (context) => RegistraProducto(),
        '/usuarios': (context) => const EliminaZapatos(),
        //'/Administrar': (context) => Administrar(),
      },
    );
  }
}
