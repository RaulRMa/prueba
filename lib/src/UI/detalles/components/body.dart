import 'package:flutter/material.dart';
import 'package:prueba/src/Backend/Producto_model.dart';
import 'package:prueba/src/UI/constants.dart';

class Body extends StatelessWidget {
  final Producto producto;
  const Body({Key? key, required this.producto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Un zapato perrón",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        producto.name,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(text: "Precio\n"),
                            TextSpan(
                                text: "\$${producto.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                          ])),
                          SizedBox(
                            width: kDefaultPadding,
                          ),
                          Expanded(
                            child: Image.memory(
                              producto.image,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
