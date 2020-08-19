import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final orderTABLE = 'OrderTable';
const String ID = 'id';
const String IMAGE = 'image';
const String NAME = 'name';
const String DATE = 'date';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "order.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onOpen: (database) {});

    return database;
  }

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $orderTABLE ("
        "id INTEGER PRIMARY KEY, "
        "image TEXT, "
        "name TEXT, "
        "date TEXT"
        ")");
  }

  Future insertDB(Database database) async {
    await database.rawInsert(
        'INSERT INTO $orderTABLE($ID,$IMAGE,$NAME,$DATE)VALUES (1, "16/11/20", "Order ID - OD11775632","No of Items : 5"),'
        '(2, "23/06/20","Order ID - OD11864428","No of Items : 4")');
  }
}
