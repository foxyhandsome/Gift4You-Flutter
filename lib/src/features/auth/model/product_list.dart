class ProductList {
  int? productId;
  String? picture;
  String? productPrice;
  String? productName;
  String? productDetail;
  int? marketId;
  Null? marketPicture;
  String? marketName;
  String? marketTel;
  String? marketAddress;
  String? marketDetail;
  String? username;

  ProductList(
      {this.productId,
      this.picture,
      this.productPrice,
      this.productName,
      this.productDetail,
      this.marketId,
      this.marketPicture,
      this.marketName,
      this.marketTel,
      this.marketAddress,
      this.marketDetail,
      this.username});

  ProductList.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    picture = json['picture'];
    productPrice = json['product_price'];
    productName = json['product_name'];
    productDetail = json['product_detail'];
    marketId = json['market_id'];
    marketPicture = json['market_picture'];
    marketName = json['market_name'];
    marketTel = json['market_tel'];
    marketAddress = json['market_address'];
    marketDetail = json['market_detail'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['picture'] = this.picture;
    data['product_price'] = this.productPrice;
    data['product_name'] = this.productName;
    data['product_detail'] = this.productDetail;
    data['market_id'] = this.marketId;
    data['market_picture'] = this.marketPicture;
    data['market_name'] = this.marketName;
    data['market_tel'] = this.marketTel;
    data['market_address'] = this.marketAddress;
    data['market_detail'] = this.marketDetail;
    data['username'] = this.username;
    return data;
  }
}