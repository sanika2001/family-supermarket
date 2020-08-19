import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final detailTABLE = 'DetailTable';
const String ID = 'id';
const String IMAGE = 'image';
const String NAME = 'name';
const String PRICE = 'price';

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

    String path = join(documentsDirectory.path, "detail.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onOpen: (database) {});

    return database;
  }

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $detailTABLE ("
        "id INTEGER PRIMARY KEY, "
        "image TEXT, "
        "name TEXT, "
        "price TEXT"
        ")");
  }

  Future insertDB(Database database) async {
    await database.rawInsert(
        'INSERT INTO $detailTABLE($ID,$IMAGE,$NAME,$PRICE)VALUES (1, "https://www.periyarrice.com/images/slider2_pro1.png", "Periyar Rice","₹ 32.00"),'
        '(2, "https://images-na.ssl-images-amazon.com/images/I/71CAb58u8TL._SL1313_.jpg","Aashirvaad Atta","₹ 84.00"),'
        '(3,"https://www.periyarrice.com/images/rice_products2.png","Periyar Matta","₹ 40.00"),'
        '(4,"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQIXENIUsCLa8rU90YdPSm2rMDAkVUUhoxNDA&usqp=CAU","Periyar Rice1","₹ 50.00")');
  }
}
