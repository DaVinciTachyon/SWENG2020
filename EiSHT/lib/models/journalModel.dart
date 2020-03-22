import '../repository/model.dart';

class Journal {
  int id;
  String body;
  String date;
  String time;
  bool isDeleted;

  Journal(this.id, this.body, this.date, this.isDeleted);

  Journal.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.body = json[DatabaseCreator.body];
    this.date = json[DatabaseCreator.date];
    this.time = json[DatabaseCreator.time];
    this.isDeleted = json[DatabaseCreator.isDeleted] == 1;
  }
}