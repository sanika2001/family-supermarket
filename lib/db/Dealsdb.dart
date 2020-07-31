import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final dealsTABLE = 'Deals';
const String IMAGE = 'image';

class DatabaseProvider1 {
  static final DatabaseProvider1 dbProvider = DatabaseProvider1();
  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "deals.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onOpen: (database) {});

    return database;
  }

  void initDB(Database database, int version) async {
    print("executed");
    await database.execute("CREATE TABLE $dealsTABLE ("
        "image TEXT "
        ")");
  }

  Future insertDB(Database database) async {
    await database.rawInsert(
        'INSERT INTO $dealsTABLE($IMAGE)VALUES("https://n4.sdlcdn.com/imgs/i/e/n/Octavius-Assam-Black-Tea-Powder-SDL618288203-1-851d8.jpg"),'
        '("https://assets.indiadesire.com/images/tresemmecobooffer.jpg"),'
        '("https://images-na.ssl-images-amazon.com/images/I/61hMdXPJqYL._SY355_.jpg")');
  }
}
