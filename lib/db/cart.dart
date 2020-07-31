import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final cartTABLE = 'Home';
const String ID = 'id';
const String IMAGE = 'image';
const String NAME = 'name';
const String RATE = 'rate';

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

    String path = join(documentsDirectory.path, "cart.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onOpen: (database) {});

    return database;
  }

  void initDB(Database database, int version) async {
    print("executed");
    await database.execute("CREATE TABLE $cartTABLE ("
        "id INTEGER PRIMARY KEY, "
        "image TEXT, "
        "name TEXT, "
        "rate TEXT"
        ")");
  }

  Future insertDB(Database database) async {
    await database.rawInsert(
        'INSERT INTO $cartTABLE($ID,$IMAGE,$NAME,$RATE)VALUES (1, "https://www.periyarrice.com/images/slider2_pro1.png", "Periyar Rice","₹ 32.00"),'
            '(2, "https://images-na.ssl-images-amazon.com/images/I/71CAb58u8TL._SL1313_.jpg","Aashirvaad Atta","₹ 84.00")');
  }
}
