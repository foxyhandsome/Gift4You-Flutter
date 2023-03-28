class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const BRAND = "brand";
  static const PRICE = "price";
  static const DESCRIPTION = "description";
  String? id;
  String? image;
  String? name;
  String? size;
  String? description;
  double? price;

  ProductModel(
      {this.id,
      this.image,
      this.name,
      this.size,
      this.price,
      this.description});

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    description = data[DESCRIPTION];
    size = data[BRAND];
    price = data[PRICE].toDouble();
  }
}


