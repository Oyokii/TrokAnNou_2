import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../JSON/service.dart';
import '../JSON/usager.dart';

class DatabaseHelper {
  // Singleton
  DatabaseHelper._();
  // INSTANCE DE LA CLASSE DE CONNEXION A LA BDD
  static final DatabaseHelper instanceBDD = DatabaseHelper._();
  static Database? _database;

  //La méthode permet d'instancier _database ou de récupérer l'instance qui est déja créée
  Future<Database?> get database async {
    // Si _database n'est pas vide / si l'instance est déjà créée alors retourne la valeur
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
    // SINON initialise l'instance de la bdd et retourne la valeur
  }

// -----------------------------------------------------------------------------------------------
  //Cette méthode est le processus qui permet d'initialiser une BDD
  // Future<Database> initDB() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   var databasesPath = await getDatabasesPath();
  //   var path = join(databasesPath, databaseName);

  //   return await openDatabase(path, version: 1, onCreate: (db, version) async {
  //     await db.execute(usagersTable);
  //     await db.execute(servicesTable);
  //     await db.execute(themeTable);
  //   });
  // }

  Future<Database> initDB() async {
    WidgetsFlutterBinding.ensureInitialized();

    return await openDatabase(
      join(await getDatabasesPath(), 'trok_an_nou.db'),
      onCreate: (db, version) async {
        db.execute(usagersTable);
        db.execute(servicesTable);
        db.execute(themeTable);
      },
      version: 1,
    );
  }
// -----------------------------------------------------------------------------------------------

  // Méthodes CRUD
  // INSERER UN SERVICE
  void insertService(Services service) async {
    final Database? db = await database;

    await db?.insert(
      'services',
      service.toMap(),
      // Si le service existe déja alors elle est remplacée
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // MODIFIER UN SERVICE
  void updateService(Services service) async {
    final Database? db = await database;
    await db?.update('services', service.toMap(),
        where: "libelle = ? && idUsager = ?",
        whereArgs: [service.libelle, service.idUsager]);
  }

  // SUPPRIMER UN SERVICE
  void deleteService(Services service) async {
    final Database? db = await database;
    await db?.delete('services',
        where: "libelle = ? && idUsager = ?",
        whereArgs: [service.libelle, service.idUsager]);
  }

  // AFFICHER MA LISTE DE SERVICES
  Future<List<Services>> services() async {
    final Database? db = await database;
    final List<Map<String, Object?>>? maps = await db?.query('services');
    List<Services> services = List.generate(maps!.length, (i) {
      return Services.fromMap(maps[i]);
    });

    if (services.isEmpty) {
      for (Services service in defaultServices) {
        insertService(service);
      }

      services = defaultServices;
    }

    return services;
  }

// -------------------------------------------------------------------------------------------
// Liste de services en dur
  final List<Services> defaultServices = [
    // Services(
    //     libelle: "Echange d'aspirateur Tyson (équivalent 300€)",
    //     descriptif:
    //         "Je suis un jeune tiboug qui cherche juste à sortir de la rue",
    //     idTheme: 2,
    //     idUsager: 2,
    //     publie: true),
    // Services(
    //     libelle: "Vendeur de qenette",
    //     descriptif:
    //         "Je suis un jeune tiboug qui cherche juste à sortir de la rue",
    //     idTheme: 3,
    //     idUsager: 3,
    //     publie: true),
    // Services(
    //     libelle: "Vendeur de qenette",
    //     descriptif:
    //         "Je suis un jeune tiboug qui cherche juste à sortir de la rue",
    //     idTheme: 3,
    //     idUsager: 3,
    //     publie: true),
    // Services(
    //     libelle: "Netto ",
    //     descriptif:
    //         "Je suis un jeune tiboug qui cherche juste à sortir de la rue",
    //     idTheme: 4,
    //     idUsager: 1,
    //     publie: true),
    // Services(
    //     libelle: "Réparation électronique de voiture",
    //     descriptif:
    //         "Je suis un jeune tiboug qui cherche juste à sortir de la rue",
    //     idTheme: 4,
    //     idUsager: 2,
    //     publie: true),
    // Services(
    //     libelle: "Vendeur de qenette",
    //     descriptif:
    //         "Je suis un jeune tiboug qui cherche juste à sortir de la rue",
    //     idTheme: 3,
    //     idUsager: 3,
    //     publie: true),
  ];
// -------------------------------------------------------------------------------------------
  final String databaseName = "trok_an_nou.db";

// LISTE DE REQUETES
  final String usagersTable = '''
    CREATE TABLE usagers(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nom TEXT,
      prenom TEXT,
      user TEXT UNIQUE,
      tel TEXT,
      mail TEXT,
      mdp TEXT,
      type TEXT
    )
  ''';

  final String themeTable = '''
    CREATE TABLE theme(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      libelle VARCHAR
    )
  ''';

  final String servicesTable = '''
    CREATE TABLE services(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      libelle VARCHAR,
      descriptif VARCHAR,
      idTheme INTEGER REFERENCES theme(id),
      idUsager INTEGER,
      publie INTEGER
    )
  ''';
  // --------------------------------------------------------------------------------------------

  Future<void> copyDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, databaseName);

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join("assets", "trok_an_nou.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
  }

//Methode pour authentifier un utilisateur
  Future<bool> authenticate(String user, String mdp) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "SELECT * FROM usagers WHERE user = ? AND mdp = ?", [user, mdp]);
    return result.isNotEmpty;
  }

//Methode pour inserer un nouvel utilisateur dans la table des usagers
  Future<int> createUser(Usagers usr) async {
    final Database db = await initDB();
    return db.insert("usagers", usr.toMap());
  }

//Methode qui récupère les informations d'un utilisateur à partir de son nom d'utilisateur
  Future<Usagers?> getUser(String usrName) async {
    final Database db = await initDB();
    var res =
        await db.query("usagers", where: "user = ?", whereArgs: [usrName]);
    return res.isNotEmpty ? Usagers.fromMap(res.first) : null;
  }
}
