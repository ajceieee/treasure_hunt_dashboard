class UserModel {
  int? highestLevelPlayed;
  String? sId;
  String? uId;
  String? fullName;
  String? email;
  String? uCode;

  UserModel({
    this.highestLevelPlayed,
    this.sId,
    this.uId,
    this.fullName,
    this.email,
    this.uCode,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    highestLevelPlayed = json['highestLevelPlayed'];
    sId = json['_id'];
    uId = json['uId'];
    fullName = json['fullName'];
    email = json['email'];
    uCode = json['uCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['highestLevelPlayed'] = this.highestLevelPlayed;
    data['_id'] = this.sId;
    data['uId'] = this.uId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['uCode'] = this.uCode;
    return data;
  }

  Map<String, dynamic> toPostJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uId'] = this.uId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['uCode'] = this.uCode;
    return data;
  }
}
