import 'dart:convert';

Theme usagersFromMap(String str) => Theme.fromMap(json.decode(str));

String themeToMap(Theme data) => json.encode(data.toMap());

class Theme {
  //int id;
  String libelle;

  Theme({
    //required this.id,
    required this.libelle,
  });

  factory Theme.fromMap(Map<String, dynamic> json) => Theme(
       // id: json['id'],
        libelle: json['libelle'],
      );

  // Méthodes pour convertir entre la classe et Map
  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'libelle': libelle,
    };
  }
}

