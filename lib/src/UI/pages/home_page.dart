import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prueba/src/UI/components/body.dart';
import 'package:prueba/src/UI/constants.dart';

class HomePage extends StatelessWidget {
  final estiloTexto = const TextStyle(fontSize: 25);
  // ignore: non_constant_identifier_names
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
        child: const Icon(Icons.add),
        onPressed: () {
          print('Hola mundo!!');
        },
      ),
    );
  }
}
