// ignore_for_file: file_names

import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:prueba/src/UI/pages/home_page.dart';
import 'package:sqflite/sqflite.dart';
import 'Producto_model.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class Backend {
  static Future<Database> _openDB() async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, 'productos.db');
    ByteData data = await rootBundle.load("lib/src/Backend/productos.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);

    return openDatabase(dbPath);
  }

  static Future<int> insert(Producto prod) async {
    Database db = await _openDB();
    return db.insert("Productos", prod.toMap());
  }

  static Future<int> delete(Producto prod) async {
    Database db = await _openDB();
    return db.delete("Productos", where: "id: ?", whereArgs: [prod.id]);
  }

  static Future<int> update(Producto prod) async {
    Database db = await _openDB();
    return db.update("Productos", prod.toMap(),
        where: "id: ?", whereArgs: [prod.id]);
  }

  static Future<List<Producto>> productos() async {
    Database db = await _openDB();

    final List<Map<String, dynamic>> productosMap = await db.query("Productos");

    return List.generate(productosMap.length, (i) {
      return Producto(
          id: productosMap[i]["Id"],
          name: productosMap[i]["nombre"],
          price: productosMap[i]["precio"],
          image: productosMap[i]["imagen"]);
    });
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<List<String>?> imagenes() async {
    List<String> listaImagenes = [
      "https://m.media-amazon.com/images/I/61soAKcHwCL._AC_UY395_.jpg",
      "https://m.media-amazon.com/images/I/61eo3o-6JSL._AC_SX425_.jpg",
      "https://i.pinimg.com/474x/b4/9c/0a/b49c0acc33ff68f408902c0eafffabab.jpg",
      "https://ss550.liverpool.com.mx/xl/1104311501.jpg",
      "https://lacalzaderia.com/wp-content/uploads/2021/05/zapatos-mocasines-hombre.jpg",
      "https://lacalzaderia.com/wp-content/uploads/2021/05/mocasines-para-hombre.jpg",
      "https://dsnegsjxz63ti.cloudfront.net/images/pg/m_326061d7326ff58.jpg",
      "https://i.ebayimg.com/images/g/BsYAAOSw81Jde2Rg/s-l400.jpg"
    ];
    return listaImagenes;
  }
}
