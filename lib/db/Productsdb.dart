import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final productsTABLE = 'Products';
const String IMAGE = 'image';

class DatabaseProvider2 {
  static final DatabaseProvider2 dbProvider = DatabaseProvider2();
  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "products.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onOpen: (database) {});

    return database;
  }

  void initDB(Database database, int version) async {
    print("executed");
    await database.execute("CREATE TABLE $productsTABLE ("
        "image TEXT "
        ")");
  }

  Future insertDB(Database database) async {
    await database.rawInsert(
        'INSERT INTO $productsTABLE($IMAGE)VALUES("https://i.ebayimg.com/images/g/o3QAAOSwDlZeqROt/s-l300.jpg"),'
        '("https://i.ytimg.com/vi/TUU4WVAVqH4/maxresdefault.jpg"),'
        '("https://5.imimg.com/data5/EM/BK/MY-7778582/bajaj-hair-oil-500x500.jpg")');
  }
}
