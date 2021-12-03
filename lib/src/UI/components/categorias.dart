import 'package:flutter/material.dart';
import '../constants.dart';

//Senecesita un componente con estado para las categorías
class Categoria extends StatefulWidget {
  const Categoria({Key? key}) : super(key: key);

  @override
  _CategoriaState createState() => _CategoriaState();
}

class _CategoriaState extends State<Categoria> {
  List<String> categorias = ["Botas", "Mocasin", "Tenis", 'Sandalias'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorias.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(categorias[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        selectedIndex == index ? kTextColor : kTextLightColor,
                  )),
              Container(
                margin: EdgeInsets.only(top: kDefaultPadding / 4),
                height: 2,
                width: 30,
                color:
                    selectedIndex == index ? Colors.black : Colors.transparent,
              )
            ]),
      ),
    );
  }
}
