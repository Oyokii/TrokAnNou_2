import 'dart:convert';

Usagers usagersFromMap(String str) => Usagers.fromMap(json.decode(str));

String usagersToMap(Usagers data) => json.encode(data.toMap());

class Usagers {
  //int id;
  String nom;
  String prenom;
  String mail;
  String user;
  String mdp;
  String tel;
  String type;

  Usagers({
    //required this.id,
    required this.nom,
    required this.prenom,
    required this.mail,
    required this.user,
    required this.mdp,
    required this.tel,
    required this.type,
  });

  factory Usagers.fromMap(Map<String, dynamic> json) => new Usagers(
       // id: json['id'],
        nom: json['nom'],
        prenom: json['prenom'],
        mail: json['mail'],
        user: json['user'],
        mdp: json['mdp'],
        tel: json['tel'],
        type: json['type'],
      );

  // Méthodes pour convertir entre la classe et Map
  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'nom': nom,
      'prenom': prenom,
      'mail': mail,
      'user': user,
      'mdp': mdp,
      'tel': tel,
      'type': type,
    };
  }
}

