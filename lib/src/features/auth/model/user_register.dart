class UserRegister {
  String? username;
  String? password;
  String? gender;
  String? fullname;
  String? email;
  String? tel;
  String? roleId;

  UserRegister(
      {this.username,
      this.password,
      this.gender,
      this.fullname,
      this.email,
      this.tel,
      this.roleId});

  UserRegister.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    gender = json['gender'];
    fullname = json['fullname'];
    email = json['email'];
    tel = json['tel'];
    roleId = json['role_id'];
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
    return data;
  }
}