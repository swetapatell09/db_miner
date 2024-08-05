import 'dart:io';

import 'package:db_miner/screen/category_model/category_model.dart';
import 'package:db_miner/screen/db_model/db_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static DBHelper helper = DBHelper._();
  DBHelper._();

  Database? database;

  Future<Database>? checkdb() async {
    if (database != null) {
      return database!;
    } else {
      return await initdb();
    }
  }

  Future<Database> initdb() async {
    Directory dir = await getApplicationSupportDirectory();
    String path = join(dir.path, "sweta.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String quotesQuery =
            "CREATE TABLE quotes (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,author TEXT,quotes TEXT)";
        String categoryQuery =
            "CREATE TABLE category (id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT)";
        db.execute(quotesQuery);
        db.execute(categoryQuery);
      },
    );
  }

  Future<void> insertQuery(dbModel model) async {
    database = await checkdb();
    database!.insert(
      "quotes",
      {
        "name": model.name,
        "author": model.author,
        "quotes": model.quotes,
      },
    );
  }

  Future<List<dbModel>>? readQuery() async {
    database = await checkdb();
    String quotes = "SELECT * FROM quotes";
    List<Map> list = await database!.rawQuery(quotes);
    List<dbModel> l1 = list.map((e) => dbModel.mapToModel(e)).toList();
    return l1;
  }

  Future<void> deleteQuery(int id) async {
    database = await checkdb();
    database!.delete("quotes", where: "id=?", whereArgs: [id]);
  }

  Future<void> insertCategory(categoryModel model) async {
    database = await checkdb();
    database!.insert(
      "category",
      {
        "category": model.name,
      },
    );
  }

  Future<List<categoryModel>>? readCategory() async {
    database = await checkdb();
    String category = "SELECT * FROM category";
    List<Map> list = await database!.rawQuery(category);
    List<categoryModel> l2 =
        list.map((e) => categoryModel.mapToModel(e)).toList();
    return l2;
  }

  Future<void> deleteCategory(int id) async {
    database = await checkdb();
    database!.delete("category", where: "id=?", whereArgs: [id]);
  }
}
