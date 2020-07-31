import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final componentsTABLE = 'Components';
const String ID = 'id';
const String IMAGE = 'image';
const String NAME = 'name';

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

    String path = join(documentsDirectory.path, "components.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onOpen: (database) {});

    return database;
  }

  void initDB(Database database, int version) async {
    print("executed");
    await database.execute("CREATE TABLE $componentsTABLE ("
        "id INTEGER PRIMARY KEY, "
        "image TEXT, "
        "name TEXT "
        ")");
  }

  Future insertDB(Database database) async {
    await database.rawInsert(
        'INSERT INTO $componentsTABLE($ID,$IMAGE,$NAME)VALUES (1, "images/wheat.png", "Food Grains & Oils"),'
            '(2, "images/instant.png", "Instant Foods"),'
            '(3, "images/snacks.png", "Confectionary"),'
            '(4, "images/tea.png", "Beverages"),'
            '(5, "images/cleaning.png", "Household Cleaning"),'
            '(6, "images/cream.png", "Beauty & Personal"),'
            '(7, "images/baby.png", "Baby Food & Care"),'
            '(8, "images/stationary.png", "Stationary"),'
            '(9, "images/more.png", "Others")');
  }
}
