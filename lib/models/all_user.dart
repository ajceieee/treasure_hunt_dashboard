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

}

class Data {
  int? highestLevelPlayed;
  String? sId;
  String? uId;
  String? fullName;
  String? email;
  List<Answers?>? answers;
  String? lastAnsweredTime;

  Data(
      {this.highestLevelPlayed,
        this.sId,
        this.uId,
        this.fullName,
        this.email,
        this.answers,
        this.lastAnsweredTime});

  Data.fromJson(Map<String, dynamic> json) {
    highestLevelPlayed = json['highestLevelPlayed'];
    sId = json['_id'];
    uId = json['uId'];
    fullName = json['fullName'];
    email = json['email'];
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
    lastAnsweredTime = json['lastAnsweredTime'];
  }

}

class Answers {
  String? sId;
  int? level;
  String? answer;
  String? time;

  Answers({this.sId, this.level, this.answer, this.time});

  Answers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    level = json['level'];
    answer = json['answer'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['level'] = this.level;
    data['answer'] = this.answer;
    data['time'] = this.time;
    return data;
  }
}

