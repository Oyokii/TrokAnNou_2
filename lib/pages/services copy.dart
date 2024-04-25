import 'package:flutter/material.dart';
import 'package:trokannou/JSON/service.dart';
import '/Components/button.dart';
import '/Components/colors.dart';
import '/JSON/usager.dart';
import '/pages/connect.dart';

import 'package:trokannou/SQLite/database_helper.dart';

// =======================================================================
// Classe de la liste des services

// =================================================================================

class ServicesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ServicesListScreenState();
  }

  const ServicesPage({super.key, this.prenom});
  final String? prenom;
}

class ServicesListScreenState extends State<ServicesPage> {
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Row(
          children: [
            Transform(
              transform: Matrix4.translationValues(
                -50.0,
                5.0,
                0.0,
              ),
              child: Text(
                "Byen bonjour",
                style: TextStyle(
                    fontSize: 19,
                    color: Color(0xFFDDA15E),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Transform(
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
          ],
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
      // FutureBuilder permet de récupérer la liste de services
      //depuis une méthode qui agis en arrière plan
      body: FutureBuilder<List<Services>>(
          // future permet d'utiliser l'instance de la bdd
          //qu'on a créé et d'utiliser la méthode qui affiche les services
          future: DatabaseHelper.instanceBDD.services(),
          // builder me permet de  dire au code ce que je fais avec ma liste de recettes
          // snapshot permet d'avoir le résultat de la liste de recettes
          builder:
              (BuildContext context, AsyncSnapshot<List<Services>> snapshot) {
            if (snapshot.hasData) {
              List<Services> services = snapshot.data!;
              return ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return Dismissible(
                      key: Key(service.libelle),
                      onDismissed: (direction) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("${service.libelle} supprimé")));
                      },
                      background: Container(
                        color: Color(0xFFDDA15E),
                      ),
                      child: ServiceItemWidget(
                        services: service,
                      ),
                      // Card(
                      //   child: Row(
                      //     children: [
                      //       Text("${service.idUsager}"),
                      //       Center(
                      //         child: Column(
                      //           children: [
                      //             Title(
                      //                 color: Colors.black,
                      //                 child: Text("${service.libelle}")),
                      //             Text("${service.descriptif}")
                      //           ],
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // )
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Ajouté',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètre',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout), label: 'Déconnexion'),
        ],
        selectedItemColor: Color(0xFFBC6C25),
        iconSize: 30,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 20),
      ),
    ));
  }
}

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({required this.services});
  final Services services;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/HomePage',
          arguments: services,
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Transform(
                        transform: Matrix4.translationValues(
                          100.0,
                          0.0,
                          0.0,
                        ),
                        child: Column(
                          children: [
                            Text(services.libelle,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        )),
                  ),
                  Text(services.descriptif,
                      style: TextStyle(color: Colors.grey[500], fontSize: 14))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// A FAIRE !

// Pour pouvoir afficher les données d'un autre table je dois :
// créer la méthode dans databasehelper
// créer une liste contenant les informations nécessaires
// Suivre les étapes et informations entrées dans le body
