//import '../models/journalModel.dart';
import '../repository/model.dart';
import '../journal/journal.dart';

class RepositoryServiceJournal {
  static Future<List<Journal>> getAllJournals() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.journalTable}
    WHERE ${DatabaseCreator.isDeleted} = 0''';
    final data = await db.rawQuery(sql);
    List<Journal> journals = List();

    for (final node in data) {
      final journal = Journal.fromJson(node);
      journals.add(journal);
    }
    return journals;
  }

  static Future<Journal> getJournal(int id) async {
    //final sql = '''SELECT * FROM ${DatabaseCreator.journalTable}
    //WHERE ${DatabaseCreator.id} = $id''';
    //final data = await db.rawQuery(sql);

    final sql = '''SELECT * FROM ${DatabaseCreator.journalTable}
    WHERE ${DatabaseCreator.id} = ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final journal = Journal.fromJson(data.first);
    return journal;
  }

  static Future<void> addJournal(Journal journal) async {
    /*final sql = '''INSERT INTO ${DatabaseCreator.journalTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.body},
      ${DatabaseCreator.date},
      ${DatabaseCreator.isDeleted}
    )
    VALUES
    (
      ${journal.id},
      "${journal.body}",
      "${journal.date}",
      ${journal.isDeleted ? 1 : 0}
    )''';*/

    final sql = '''INSERT INTO ${DatabaseCreator.journalTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.body},
      ${DatabaseCreator.date},
      ${DatabaseCreator.time},
      ${DatabaseCreator.isDeleted}
    )
    VALUES (?,?,?,?,?)''';
    List<dynamic> params = [journal.id, journal.body, journal.date,journal.time, journal.isDeleted ? 1 : 0];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add journal', sql, null, result, params);
  }

  static Future<void> deleteJournal(Journal journal) async {
    /*final sql = '''UPDATE ${DatabaseCreator.journalTable}
    SET ${DatabaseCreator.isDeleted} = 1
    WHERE ${DatabaseCreator.id} = ${journal.id}
    ''';*/

    final sql = '''UPDATE ${DatabaseCreator.journalTable}
    SET ${DatabaseCreator.isDeleted} = 1
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [journal.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Delete journal', sql, null, result, params);
  }

  static Future<void> updateJournal(Journal journal) async {
    /*final sql = '''UPDATE ${DatabaseCreator.journalJournal}
    SET ${DatabaseCreator.body} = "${journal.body}"
    WHERE ${DatabaseCreator.id} = ${journal.id}
    ''';*/

    final sql = '''UPDATE ${DatabaseCreator.journalTable}
    SET ${DatabaseCreator.body} = ?
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [journal.body, journal.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Update journal', sql, null, result, params);
  }

  static Future<int> journalsCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.journalTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
  static Future<int> journalsCountWithoutDeleted() async{
final sql = '''SELECT * FROM ${DatabaseCreator.journalTable}
    WHERE ${DatabaseCreator.isDeleted} = 0''';
final data = await db.rawQuery(sql);
List<Journal> journals = List();

for (final node in data) {
  final journal = Journal.fromJson(node);
  journals.add(journal);
}
return journals.length;

  }
}