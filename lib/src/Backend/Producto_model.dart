class Producto {
  final int id;
  final String name;
  final int price;

  Producto(
      {required int this.id,
      required String this.name,
      required int this.price,});

  Map<String, dynamic> toMap(){
    return{
      'id' : this.id,
      'name' : this.name,
      'price' : this.price,
    };
  }

}
