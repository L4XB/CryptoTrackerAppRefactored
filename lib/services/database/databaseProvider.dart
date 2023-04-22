import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:foodapp/common/errors/databaseExeption/databaseExeption.dart';
import 'package:foodapp/common/errors/databaseExeption/databaseExeptionType.dart';
import 'package:foodapp/models/databaseModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabaseProvider {
  ///Open Database for User
  ///[databaseName] -> new name of Database
  ///[tableName] -> new name of Table
  ///[retuns] -> Database Table
  ///[oneError] -> trow Database Expetion
  dynamic openUserDatabase(String databaseName, String tableName) async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      final database = openDatabase(
        join(await getDatabasesPath(), databaseName),
        onCreate: (db, version) {
          db.execute(
            'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, name TEXT, email TEXT, image TEXT, sessionToken TEXT)',
          );
        },
        version: 1,
      );
      return database;
    } catch (e) {
      throw DatabaseExeption(DatabaseExeptionType.CantOpenNewDataBase);
    }
  }

  ///Insert new User to Database
  ///[user] -> userModel
  ///[retuns] -> true if it was succesfully
  ///[oneError] -> trow Database Expetion
  Future<bool?> insertUserDataIntoDatabase(DatabaseUserModel user) async {
    try {
      final db = await openUserDatabase("chainingUser.db", "User");
      await db.insert(
        'User',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      throw DatabaseExeption(DatabaseExeptionType.CantInsertUserToDatabse);
    }
  }

  ///Read current Database
  ///[retuns] -> Local Database
  ///[oneError] -> trow Database Expetion
  Future<List<DatabaseUserModel>> readDatabase() async {
    try {
      final db = await openUserDatabase("chainingUser.db", "User");
      final List<Map<String, dynamic>> maps = await db.query('User');

      return List.generate(maps.length, (i) {
        return DatabaseUserModel(
            id: maps[i]['id'],
            name: maps[i]['name'],
            email: maps[i]['email'],
            sessionToken: maps[i]["sessionToken"],
            image: maps[i]['image']);
      });
    } catch (e) {
      throw DatabaseExeption(DatabaseExeptionType.ErrorReadingDatabase);
    }
  }

  ///Delete User in Database
  ///[retuns] -> true if was successfull
  ///[oneError] -> trow Database Expetion
  Future<bool?> deleteAllUser() async {
    try {
      final db = await openUserDatabase("chainingUser.db", "User");
      for (var i in db["User"]) {
        await db.delete(
          'User',
          where: 'id = ?',
          whereArgs: [i + 1],
        );
      }
      return true;
    } catch (e) {
      throw DatabaseExeption(DatabaseExeptionType.CantDeleteUser);
    }
  }
}
