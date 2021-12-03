import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prueba/src/Backend/Producto_model.dart';
import 'package:prueba/src/UI/constants.dart';
import 'package:prueba/src/UI/detalles/components/body.dart';

class PantallaDetalles extends StatelessWidget {
  final Producto producto;
  final icon_path = 'lib/src/assets/icons/';

  const PantallaDetalles({Key? key, required this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: productColor,
      appBar: buildAppBar(context),
      body: Body(
        producto: producto,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: productColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(icon_path + "back.svg", color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(icon_path + "search.svg")),
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(icon_path + "cart.svg")),
        SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}
