import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final categoriesTABLE = 'Categories';
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

    String path = join(documentsDirectory.path, "categories.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onOpen: (database) {});

    return database;
  }

  void initDB(Database database, int version) async {
    print("executed");
    await database.execute("CREATE TABLE $categoriesTABLE ("
        "id INTEGER PRIMARY KEY, "
        "image TEXT, "
        "name TEXT "
        ")");
  }

  Future insertDB(Database database) async {
    await database.rawInsert(
        'INSERT INTO $categoriesTABLE($ID,$IMAGE,$NAME)VALUES (1, "images/wheat.png", "Food Grains,Oils & Masala"),'
            '(2, "images/instant.png", "Instant Foods"),'
            '(3, "images/snacks.png", "Snacks & Confectionary"),'
            '(4, "images/cleaning.png", "Household Cleaning")');
  }
}