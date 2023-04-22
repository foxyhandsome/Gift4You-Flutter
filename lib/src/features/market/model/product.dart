class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const BRAND = "brand";
  static const PRICE = "price";
  static const DESCRIPTION = "description";
  static const MARKETNAME = "market_name";
  static const CATEGORY = "category";
  static const GENDER = "gender";
  static const SPECIALDAY = "specialday";
  String? id;
  String? image;
  String? name;
  String? size;
  String? description;
  String? category;
  String? gender;
  String? specialday;
  String? marketName;
  double? price;

  int? marketId;
  String? marketPicture;
  String? marketTel;
  String? marketAddress;
  String? marketDetail;
  String? username;

  ProductModel({
    this.marketId,
    this.marketPicture,
    this.marketTel,
    this.marketAddress,
    this.marketDetail,
    this.username,
    this.id,
    this.image,
    this.name,
    this.size,
    this.price,
    this.description,
    this.category,
    this.gender,
    this.specialday,
    this.marketName,
  });

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    description = data[DESCRIPTION];
    marketName = data[MARKETNAME];
    category = data[CATEGORY];
    gender = data[GENDER];
    specialday = data[SPECIALDAY];
    size = data[BRAND];
    price = data[PRICE].toDouble();
  }
}
