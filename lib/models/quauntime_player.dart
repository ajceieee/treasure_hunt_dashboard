class QuarauntimePlayer {
  int? status;
  String? message;
  List<Result?>? result;

  QuarauntimePlayer({this.status, this.message, this.result});

  QuarauntimePlayer.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        if (result != null) {
          result!.add(new Result.fromJson(v));
        } else {
          result = null;
        }
      });
    }
  }
}

class Result {
  String? rank;
  String? name;
  String? totalScore;
  String? quiz;
  String? wordSearch;
  String? cryptography;
  String? crossword;
  String? aptitudeTest;
  String? treasureHunt;
  String? bonus;

  Result(
      {this.rank,
      this.name,
      this.totalScore,
      this.quiz,
      this.wordSearch,
      this.cryptography,
      this.crossword,
      this.aptitudeTest,
      this.treasureHunt,
      this.bonus});

  Result.fromJson(Map<String, dynamic> json) {
    rank = json['Rank'];
    name = json['Name'];
    totalScore = json['Total Score'];
    quiz = json['Quiz'];
    wordSearch = json['Word Search'];
    cryptography = json['Cryptography'];
    crossword = json['Crossword'];
    aptitudeTest = json['Aptitude Test'];
    treasureHunt = json['Treasure Hunt'];
    bonus = json['Bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Rank'] = this.rank;
    data['Name'] = this.name;
    data['Total Score'] = this.totalScore;
    data['Quiz'] = this.quiz;
    data['Word Search'] = this.wordSearch;
    data['Cryptography'] = this.cryptography;
    data['Crossword'] = this.crossword;
    data['Aptitude Test'] = this.aptitudeTest;
    data['Treasure Hunt'] = this.treasureHunt;
    data['Bonus'] = this.bonus;
    return data;
  }
}
