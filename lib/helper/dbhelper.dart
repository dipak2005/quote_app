// ignore_for_file: empty_constructor_bodies, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:quote_app_af/model/quotedata.dart';
import 'package:sqflite/sqflite.dart';

import '../model/quotemodel.dart';

class DBHelper {
  static final DBHelper _dbHelper = DBHelper._();

  DBHelper._();

  final dbname = "quote.db";
  final quoteData = "Quote_data";

  factory DBHelper() {
    return _dbHelper;
  }

  static DBHelper get instance => _dbHelper;

  Database? database;

  Future initDatabase() async {
    database = await openDatabase(dbname, version: 6, onCreate: (db, version) {
      db.execute('''CREATE TABLE "$quoteData" (
	"id"	INTEGER UNIQUE,
	"quote"	TEXT NOT NULL,
	"image"	TEXT NOT NULL,
	"type"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
)''');
    }, singleInstance: true);
  }

  Future insertQuote(QuoteData quote) async {
    if (database == null) {
      await initDatabase();
    }
    var db = await openDatabase(dbname);

    db.insert(quoteData, {
      "quote": quote.quote.toString(),
      "image": quote.image,
      "type": quote.type.toString()
    });

    db.close();
  }

  deleteQuote(QuoteData quote) async {
    if (database == null) {
      await initDatabase();
    }
    var db = await openDatabase(dbname);
    db.delete(quoteData, where: "quote = ?", whereArgs: [quote]);
  }

  Future<List<Map<String, Object?>>?> getQuote() async {
    database = await openDatabase(dbname);
    return await database?.rawQuery("select * from $quoteData");
  }
// Future deleteQuote(int id) async {
//   database?.delete(quoteData, whereArgs: [id], where: "id=?");
//   database?.close();
// }
}
