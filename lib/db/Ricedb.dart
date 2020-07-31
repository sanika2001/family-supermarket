import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final riceTABLE = 'Rice';
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
    String path = join(documentsDirectory.path, "rice.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onOpen: (database) {});

    return database;
  }

  void initDB(Database database, int version) async {
    print("executed");
    await database.execute("CREATE TABLE $riceTABLE ("
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
        'INSERT INTO $riceTABLE($IMAGE,$RICENAME,$PRICE,$RATE,$PRESSED,$QTY) VALUES ("https://www.periyarrice.com/images/slider2_pro1.png", "Periyar Rice","₹ 40.00", "₹ 32.00", 0, 1),'
        '("https://www.periyarrice.com/images/rice_products2.png", "Periyar Matta","₹ 40.00", "₹ 60.00", 0, 1),'
        '("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQIXENIUsCLa8rU90YdPSm2rMDAkVUUhoxNDA&usqp=CAU","Periyar Rice1","₹ 40.00","₹ 60.00",0,1),'
        '("https://www.freshopy.com/image/cache/catalog/Rice/Rice/Periyar%20Sortex%20Vadi%20Rice%205kg.jpg","Periyar Rice2","₹ 40.00","₹ 32.00",0,1)');
  }
}
