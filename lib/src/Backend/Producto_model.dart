// ignore_for_file: file_names

import 'dart:typed_data';

class Producto {
  final int id;
  final String name;
  final int price;
  final Uint8List image;

  Producto({
    required int this.id,
    required String this.name,
    required int this.price,
    required Uint8List this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
      'imagen': this.image,
    };
  }
}
