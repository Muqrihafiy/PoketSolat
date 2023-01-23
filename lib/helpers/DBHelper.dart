import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../models/inventorymodel.dart';

class DBHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'inventory.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
// creating database table
  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE inventory(id INTEGER PRIMARY KEY, name TEXT, price INTEGER, quantity INTEGER,   image TEXT)');
  }
// inserting data into the table
  Future<Inventory> insert(Inventory inventory) async {
    var dbClient = await database;
    await dbClient!.insert('inventory', inventory.toMap());
    return inventory;
  }
// getting all the items in the list from the database
  Future<List<Inventory>> getInventoryList() async {
    var dbClient = await database;
    final List<Map<String, Object?>> queryResult =
    await dbClient!.query('inventory');
    return queryResult.map((result) => Inventory.fromMap(result)).toList();
  }
  Future<List<Inventory>> getCartId(int id) async {
    var dbClient = await database;
    final List<Map<String, Object?>> queryIdResult =
    await dbClient!.query('inventory', where: 'id = ?', whereArgs: [id]);
    return queryIdResult.map((e) => Inventory.fromMap(e)).toList();
  }

}