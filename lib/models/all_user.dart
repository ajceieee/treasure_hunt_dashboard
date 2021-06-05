class AllUser {
  int? status;
  String? message;
  List<Data>? data;

  AllUser({this.status, this.message, this.data});

  AllUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? highestLevelPlayed;
  String? sId;
  String? uId;
  String? fullName;
  String? email;
  String? uCode;

  Data(
      {this.highestLevelPlayed,
        this.sId,
        this.uId,
        this.fullName,
        this.email,
        this.uCode});

  Data.fromJson(Map<String, dynamic> json) {
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
}