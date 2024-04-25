import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:trokannou/JSON/service.dart';

class LandingPage extends StatelessWidget {
  static var libelle = "";
  static var descriptif = "";
  static var idTheme = 0;
  static var idUsager = 0;
  static var publie = true;

  LandingPage({super.key});

  // Déclaration de la liste des services
  final List<Services> _servicesList = [];
  // ignore: unused_field
  final _services = Services(
      // libelle: libelle,
      // descriptif: descriptif,
      // idTheme: idTheme,
      // idUsager: idUsager,
      // publie: publie
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Transform(
          // you can forcefully translate values left side using Transform
          transform: Matrix4.translationValues(
            0.0,
            5.0,
            0.0,
          ),
          child: Image.asset(
            "images/logo2.png",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(
            transform: Matrix4.translationValues(349.0, 0.0, 0.0),
            child: IconButton(
              onPressed: () => print('pressé'),
              icon: Icon(Icons.menu),
              color: Color(0xFFDDA15E),
              iconSize: 50,
            )),
      ),
      body: ListView.builder(
          itemCount: _servicesList.length,
          itemBuilder: (contexte, index) {
            return Dismissible(
                key: Key(index.toString()),
                onDismissed: (direction) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('$index dismissed'),
                  ));
                },
                background: Container(
                  color: Color(0xFFDDA15E),
                ),
                child: Card(
                  child: ListTile(title: Text("#hashtag")),
                ));
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/home.png")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/ajouter.png")),
            label: 'Ajouté',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/parametre.png")),
            label: 'Réglages',
          ),
        ],
        selectedItemColor: Color(0xFFBC6C25),
      ),
    ));
  }
}
