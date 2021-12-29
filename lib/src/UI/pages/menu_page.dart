import 'package:flutter/material.dart';
import 'package:prueba/src/UI/constants.dart';

class FirstHome extends StatefulWidget {
  final String title;
  const FirstHome({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FirstHome> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Image.asset('lib/src/assets/images/Logo.png',
              height: 250, width: 250),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                padding: EdgeInsets.only(top: 10),
                child: const Text('BIENVENIDO',
                    style: TextStyle(fontSize: 26, color: Colors.white60))),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Boton(context, 'Registrate', '/Registrar', 20.0),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                padding: EdgeInsets.only(top: 1),
                child: FlatButton(
                  minWidth: 300,
                  onPressed: () {
                    Navigator.pushNamed(context, '/Login');
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.redAccent,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text('Iniciar Sesión',
                      style: TextStyle(color: Colors.blueGrey)),
                )),
          ]),
        ],
      ),
    );
  }
}

Widget Boton(BuildContext context, var texto, var direccion, var separacion) {
  return Container(
      padding: EdgeInsets.only(top: separacion),
      child: ButtonTheme(
        minWidth: 300.0,
        child: RaisedButton(
          color: Colors.white,
          textColor: Colors.blueGrey,
          child: Text(texto),
          onPressed: () {
            Navigator.pushNamed(context, direccion);
          },
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.redAccent, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(20)),
        ),
      ));
}
