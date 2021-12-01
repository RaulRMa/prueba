import 'package:flutter/material.dart';
import 'package:prueba/src/UI/pages/home_page.dart';
import './constants.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context ){

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tienda perrona',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Center(
        child: HomePage(),
      ),
    );

  }

}