class Market {
  int? marketId;
  String? marketPicture;
  String? marketName;
  String? marketTel;
  String? marketAddress;
  String? marketDetail;
  String? username;

  Market(
      {this.marketId,
      this.marketPicture,
      this.marketName,
      this.marketTel,
      this.marketAddress,
      this.marketDetail,
      this.username});

  Market.fromJson(Map<String, dynamic> json) {
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
