import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'trok_an_nou.db');
    var database =
        await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    String usagersTable = '''CREATE TABLE usagers (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nom VARCHAR,
      prenom VARCHAR,
      user VARCHAR UNIQUE,
      tel VARCHAR,
      mail VARCHAR,
      mdp VARCHAR,
      type VARCHAR
    );''';
    
    String themeTable = '''CREATE TABLE theme(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      libelle VARCHAR,
    );''';
    
    String servicesTable = '''CREATE TABLE services(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      libelle VARCHAR,
      descriptif VARCHAR,
      idTheme INTEGER FOREIGN KEY (idTheme) REFERENCES Theme(id),
      idUsager INTEGER,
      publie INTEGER,
    );
    ''';

    await database.execute(usagersTable);
    await database.execute(themeTable);
    await database.execute(servicesTable);
  }
}
