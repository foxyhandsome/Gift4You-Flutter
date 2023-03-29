class UserInfo {
  String? username;
  String? password;
  String? gender;
  String? fullname;
  String? email;
  String? tel;
  String? roleId;
  String? userType;
  int? marketId;
  String? marketPicture;
  String? marketName;
  String? marketTel;
  String? marketAddress;
  String? marketDetail;

  UserInfo(
      {this.username,
      this.password,
      this.gender,
      this.fullname,
      this.email,
      this.tel,
      this.roleId,
      this.userType,
      this.marketId,
      this.marketPicture,
      this.marketName,
      this.marketTel,
      this.marketAddress,
      this.marketDetail});

  UserInfo.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    gender = json['gender'];
    fullname = json['fullname'];
    email = json['email'];
    tel = json['tel'];
    roleId = json['role_id'];
    userType = json['user_type'];
    marketId = json['market_id'];
    marketPicture = json['market_picture'];
    marketName = json['market_name'];
    marketTel = json['market_tel'];
    marketAddress = json['market_address'];
    marketDetail = json['market_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['tel'] = this.tel;
    data['role_id'] = this.roleId;
    data['user_type'] = this.userType;
    data['market_id'] = this.marketId;
    data['market_picture'] = this.marketPicture;
    data['market_name'] = this.marketName;
    data['market_tel'] = this.marketTel;
    data['market_address'] = this.marketAddress;
    data['market_detail'] = this.marketDetail;
    return data;
  }
}
