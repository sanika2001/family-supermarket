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
        'INSERT INTO $orderTABLE($ID,$IMAGE,$NAME,$DATE)VALUES (1, "https://www.periyarrice.com/images/slider2_pro1.png", "Periyar Rice","Delivered on Feb 01"),'
            '(2, "https://images-na.ssl-images-amazon.com/images/I/71CAb58u8TL._SL1313_.jpg","Aashirvaad Atta","Delivered on Dec 13")');
  }
}
