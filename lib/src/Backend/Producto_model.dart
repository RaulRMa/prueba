// ignore_for_file: file_names

import 'dart:typed_data';

class Producto {
  int? id;
  final String nombre;
  final int precio;
  final String imagen;
  final String descripcion;

  Producto(
      {int? this.id,
      required String this.nombre,
      required int this.precio,
      required String this.imagen,
      required String this.descripcion});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'precio': precio,
      'imagen': imagen,
      'descripcion': descripcion,
    };
  }
}
