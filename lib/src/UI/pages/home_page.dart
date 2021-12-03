import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba/src/UI/components/body.dart';
import 'package:prueba/src/UI/constants.dart';
import '../../Backend/BaseDatos.dart';
import '../../Backend/Producto_model.dart';

class HomePage extends StatelessWidget {
  final estiloTexto = new TextStyle(fontSize: 25);
  final icon_path = 'lib/src/assets/icons/';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: SvgPicture.asset(icon_path + 'back.svg')),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                icon_path + 'search.svg',
                color: kTextColor,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                icon_path + 'cart.svg',
                color: kTextColor,
              )),
          SizedBox(width: kDefaultPadding / 2),
        ],
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Hola mundo!!');
        },
      ),
    );
  }
}
