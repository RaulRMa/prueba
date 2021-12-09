import 'package:flutter/material.dart';

class Registrar extends StatelessWidget {
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
              child: TextoRedondo('E-mail'),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: TextoRedondo('Contraseña'),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: TextoRedondo('Confirma Contraseña'),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            /*Container(
                padding: EdgeInsets.only(top: 20),
                child: ButtonTheme(
                  minWidth: 300.0,
                  child: RaisedButton(
                    color: Colors.white,
                    textColor: Colors.blueGrey,
                    child: Text('Registrar'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Catalogo');
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.redAccent,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )),*/
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/Catalogo'),
              child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                    minWidth: 300.0,
                    child: RaisedButton(
                      color: Colors.white,
                      textColor: Colors.blueGrey,
                      child: Text('Registrar'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Catalogo');
                      },
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.redAccent,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )),
            )
          ]),
        ],
      ),
    );
  }
}

Widget TextoRedondo(var texto) {
  return Container(
    //width: 200,
    padding: EdgeInsets.only(top: 30),
    child: TextField(
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
