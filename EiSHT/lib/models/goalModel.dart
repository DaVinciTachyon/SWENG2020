import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

class Goal {
  @required
  final int id;
  @required
  final String goalName;
  @required
  final String goalMini;
  @required
  final String goalDescription;
  @required
  final double percentageComplete;
  @required
  final DateTime endDay;
  @required
  final DateTime dateNow;

  Goal({
    this.id,
    this.goalName,
    this.goalMini,
    this.goalDescription,
    this.percentageComplete,
    this.endDay,
    this.dateNow,
  });

  Goal.fromDb(Map<String, dynamic> map)
      : this.id = map['id'],
        this.goalName = map['name'],
        this.goalMini = map['mini'],
        this.goalDescription = map['description'],
        this.percentageComplete = map['percentageComplete'],
        this.endDay = DateTime.parse(map['endDay']),
        this.dateNow = DateTime.parse(map['dateNow']);

  Map<String, dynamic> toMapForDb() {
    var map = Map<String, dynamic>();
    map['id'] = this.id;
    map['name'] = this.goalName;
    map['mini'] = this.goalMini;
    map['description'] = this.goalDescription;
    map['percentageComplete'] =
        this.percentageComplete > 1 ? 1 : this.percentageComplete;
    map['endDay'] = this.endDay.toString();
    map['dateNow'] = this.dateNow.toString();
    return map;
  }
}
