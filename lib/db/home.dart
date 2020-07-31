import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final homeTABLE = 'Home';
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

    String path = join(documentsDirectory.path, "home.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onOpen: (database) {});

    return database;
  }

  void initDB(Database database, int version) async {
    print("executed");
    await database.execute("CREATE TABLE $homeTABLE ("
        "id INTEGER PRIMARY KEY, "
        "image TEXT, "
        "name TEXT "
        ")");
  }

  Future insertDB(Database database) async {
    await database.rawInsert(
        'INSERT INTO $homeTABLE($ID,$IMAGE,$NAME)VALUES (1, "images/wheat.png", "Food Grains,Oils & Masala")');
    await database.rawInsert(
        'INSERT INTO $homeTABLE($ID,$IMAGE,$NAME)VALUES (2, "images/instant.png", "Instant Foods")');
    await database.rawInsert(
        'INSERT INTO $homeTABLE($ID,$IMAGE,$NAME)VALUES (3, "images/snacks.png", "Snacks & Confectionary")');
    await database.rawInsert(
        'INSERT INTO $homeTABLE($ID,$IMAGE,$NAME)VALUES (4, "images/tea.png", "Beverages")');
    await database.rawInsert(
        'INSERT INTO $homeTABLE($ID,$IMAGE,$NAME)VALUES (5, "images/cleaning.png", "Household & Cleaning")');
    await database.rawInsert(
        'INSERT INTO $homeTABLE($ID,$IMAGE,$NAME)VALUES (6, "images/cream.png", "Beauty & Personal Care")');
    await database.rawInsert(
        'INSERT INTO $homeTABLE($ID,$IMAGE,$NAME)VALUES (7, "images/baby.png", "Baby Food & Care")');
    await database.rawInsert(
        'INSERT INTO $homeTABLE($ID,$IMAGE,$NAME)VALUES (8, "images/stationary.png", "Stationary")');
    await database.rawInsert(
        'INSERT INTO $homeTABLE($ID,$IMAGE,$NAME)VALUES (9, "images/more.png", "Others")');
  }
}
