import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:prueba/src/UI/pages/home_page.dart';
import 'package:sqflite/sqflite.dart';
import 'Producto_model.dart';
import 'dart:async';

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
      );
    });
  }
}
