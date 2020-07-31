import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final flourTABLE = 'Flour';
const String IMAGE = 'image';
const String RICENAME = 'ricename';
const String PRICE = 'price';
const String RATE = 'rate';
const String PRESSED = 'pressed';
const String QTY = 'qty';

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
    String path = join(documentsDirectory.path, "flour.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onOpen: (database) {});

    return database;
  }

  void initDB(Database database, int version) async {
    print("executed");
    await database.execute("CREATE TABLE $flourTABLE ("
        "image TEXT, "
        "ricename TEXT PRIMARY KEY, "
        "price TEXT, "
        "rate TEXT, "
        "pressed INTEGER, "
        "qty INTEGER "
        ")");
  }

  Future insertDB(Database database) async {
    await database.rawInsert(
        'INSERT INTO $flourTABLE($IMAGE,$RICENAME,$PRICE,$RATE,$PRESSED,$QTY) VALUES("https://images-na.ssl-images-amazon.com/images/I/71CAb58u8TL._SL1313_.jpg","Aashirvaad Atta","₹ 40.00","₹ 32.00",0,1),'
        '("https://www.periyarrice.com/images/rice_products2.png", "Periyar Atta","₹ 40.00", "₹ 60.00",0, 1),'
        '("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQIXENIUsCLa8rU90YdPSm2rMDAkVUUhoxNDA&usqp=CAU","Double Horse Atta","₹ 40.00","₹ 60.00",0,1),'
        '("https://www.freshopy.com/image/cache/catalog/Rice/Rice/Periyar%20Sortex%20Vadi%20Rice%205kg.jpg","Periyar Atta1","₹ 40.00","₹ 32.00",0,1)');
  }
}
