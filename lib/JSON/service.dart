import 'dart:convert';

Services servicesFromMap(String str) => Services.fromMap(json.decode(str));

String servicesToMap(Services data) => json.encode(data.toMap());

class Services {
  //int id;
  String libelle = "";
  String descriptif = "";
  int? idTheme;
  int? idUsager;
  bool publie = true;

  // Services(String libelle, String descriptif, int idTheme, int idUsager,
  //     bool publie) {
  //   this.libelle = libelle;
  //   this.descriptif = descriptif;
  //   this.idTheme = idTheme;
  //   this.idUsager = idUsager;
  //   this.publie = publie;
  // }

  Services() {
    this.libelle = libelle;
    this.descriptif = descriptif;
    this.idTheme = idTheme;
    this.idUsager = idUsager;
    this.publie = publie;
  }

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

  void set leLibelle(String libelle) {
    this.libelle = libelle;
  }

  String get leLibelle {
    return libelle;
  }

  void set leDescriptif(String descriptif) {
    this.descriptif = descriptif;
  }

  String get leDescriptif {
    return descriptif;
  }

  void set leIdUsager(int idUsager) {
    this.idUsager = idUsager;
  }

  int get leIdUsager {
    return idUsager!;
  }

  void set leIdTheme(int idTheme) {
    this.idTheme = idTheme;
  }

  int get leIdTheme {
    return idTheme!;
  }

  void set estPublie(bool publie) {
    this.publie = publie;
  }

  bool get estPublie {
    return publie;
  }

  Services.request({
    //required this.id,
    required this.libelle,
    required this.descriptif,
    required this.idTheme,
    required this.idUsager,
    required this.publie,
  });

  factory Services.fromMap(Map<String, dynamic> json) => Services.request(
        // id: json['id'],
        libelle: json['libelle'],
        descriptif: json['descriptif'],
        idTheme: json['idTheme'],
        idUsager: json['idUsager'],
        publie: json['publie'] == true,
      );

  // Méthodes pour convertir entre la classe et Map
  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'libelle': libelle,
      'descriptif': descriptif,
      'idTheme': idTheme,
      'idUsager': idUsager,
      'publie': publie,
    };
  }
}
