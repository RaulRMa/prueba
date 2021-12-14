// ignore_for_file: file_names

import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:prueba/src/Backend/usuario_model.dart';
import 'package:sqflite/sqflite.dart';
import 'Producto_model.dart';
import 'dart:async';

class Backend {
  static Future<Database> _openDB() async {
    //var databasesPath = await getDatabasesPath();
    var path = "lib/src/Backend/productos.db";
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data =
          await rootBundle.load(join("lib", "src", "Backend", "productos.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    // var dbDir = await getDatabasesPath();

    // var dbPath = join(dbDir, 'productos.db');
    // ByteData data = await rootBundle.load("lib/src/Backend/productos.db");
    // List<int> bytes =
    //     data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // await File(dbPath).writeAsBytes(bytes);
    return openDatabase(path);
  }

  static Future<int> insert(Producto prod) async {
    Database db = await _openDB();
    return db.insert("Productos4", prod.toMap());
  }

  static Future<int> inserta_usuario(Usuario usuario) async {
    Database db = await _openDB();
    try {
      int result = await db.insert(
        'Usuarios2',
        usuario.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Este es el resultado: $result");
      db.close();
      return result;
    } catch (e) {
      print(e);
      // await db.execute(
      //     'CREATE TABLE Usuarios2 (Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, email TEXT(30) NOT NULL, contrasena TEXT NOT NULL)');
      // inserta_usuario(usuario);

      return 0;
    }
  }

  static Future<List<Usuario>> getUsuarios() async {
    Database db = await _openDB();
    final List<Map<String, dynamic>> usuariosMap = await db.query("Usuarios2");

    return List.generate(usuariosMap.length, (i) {
      return Usuario(
          email: usuariosMap[i]["email"],
          contrasena: usuariosMap[i]["contrasena"]);
    });
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

  static Future<List<Producto>?> productos() async {
    Database db = await _openDB();
    try {
      final List<Map<String, dynamic>> productosMap =
          await db.query("Productos4");
      db.close();
      return List.generate(productosMap.length, (i) {
        return Producto(
            id: productosMap[i]["Id"],
            nombre: productosMap[i]["nombre"],
            precio: productosMap[i]["precio"],
            imagen: productosMap[i]["imagen"],
            descripcion: productosMap[i]["descripcion"]);
      });
    } catch (e) {
      db.execute(
          'CREATE TABLE Productos4 (Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nombre TEXT(30) NOT NULL, precio INTEGER NOT NULL, imagen TEXT, descripcion TEXT NOT NULL)');
      db.close();
      return null;
    }
  }
}
