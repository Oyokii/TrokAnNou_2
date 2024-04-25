import 'package:sqflite/sqflite.dart';
import 'package:trokannou/database/databaseConnection.dart';

class Repository {
  late DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  // AJOUTER
  insert(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  // LISTER
  read(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  // MODIFIER
  update(table, data) async {
    var connection = await database;
    return await connection?.update(table, data);
  }

  // SUPPRIME
  delete(table) async {
    var connection = await database;
    return await connection?.delete(table);
  }
}
