import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trokannou/pages/ajoutService.dart';
import 'package:trokannou/pages/home.dart';
import 'package:trokannou/pages/serviceDetails.dart';
import '../SQLite/database_helper.dart';
import '/JSON/service.dart';
import '/Components/button.dart';
import '/Components/colors.dart';
import '/JSON/usager.dart';
import '/pages/connect.dart';

// =======================================================================
// Classe de la liste des services

// =================================================================================

class ServicesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ServicesListScreenState();
  }
}

// const ServicesPage({super.key, this.prenom});
//   final String? prenom;

//   const ServiceItemWidget({required this.services}) {
//    // TODO: implement ServiceItemWidget
//    throw UnimplementedError();
//    }
//   final Services services;

class ServicesListScreenState extends State<ServicesPage> {
  int _currentIndex = 0;
  setCurrenIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
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
                "Byen bonjou",
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
      body: [
        getListeServices(),
        ajoutService(),
        ajoutService(),
        ConnectPage()
      ][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setCurrenIndex(index),
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

// FutureBuilder permet de récupérer la liste de services
//depuis une méthode qui agis en arrière plan
// body: FutureBuilder<List<Services>> /*getListeServices*/ (
//     // future permet d'utiliser l'instance de la bdd
//     //qu'on a créé et d'utiliser la méthode qui affiche les services
//     future: DatabaseHelper.instanceBDD.services(),
//     // builder me permet de  dire au code ce que je fais avec ma liste de recettes
//     // snapshot permet d'avoir le résultat de la liste de recettes
//     builder:
//         (BuildContext context, AsyncSnapshot<List<Services>> snapshot) {
//       if (snapshot.hasData) {
//         List<Services> services = snapshot.data!;
//         return ListView.builder(
//             itemCount: services.length,
//             itemBuilder: (context, index) {
//               final service = services[index];
//               return Dismissible(
//                   key: Key(service.libelle),
//                   onDismissed: (direction) {
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         content: Text("${service.libelle} supprimé")));
//                   },
//                   background: Container(
//                     color: Color(0xFFDDA15E),
//                   ),
//                   child: Container(
//                     color: Colors.amber,
//                     child: Column(
//                       children: [
//                         ServiceItemWidget(
//                           services: service,
//                         ),
//                       ],
//                     ),
//                   )
//                   // Card(
//                   //   child: Row(
//                   //     children: [
//                   //       Text("${service.idUsager}"),
//                   //       Center(
//                   //         child: Column(
//                   //           children: [
//                   //             Title(
//                   //                 color: Colors.black,
//                   //                 child: Text("${service.libelle}")),
//                   //             Text("${service.descriptif}")
//                   //           ],
//                   //         ),
//                   //       )
//                   //     ],
//                   //   ),
//                   // )
//                   );
//             });
//       } else {
//         return Center(child: CircularProgressIndicator());
//       }
//     }),

ListView getListeServices() {
  Services services = Services();
  

  var count = 1;
  return ListView.builder(
    itemCount: count,
    itemBuilder: (BuildContext context, int position) {
      return Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("images/yuka.png"),
          ),

          title: Text(services.libelle),

          subtitle: Text(services.descriptif),

          trailing: Icon(
            Icons.delete,
            color: Colors.red,
          ),

          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ServiceDetailsPage())),

          // Text("${service.idUsager}"),
          // Text("${service.libelle}")
          // Text("${service.descriptif}")
        ),
      );
    },
  );
}

// class ServiceItemWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return ServicesListScreenState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Card(
//           margin: EdgeInsets.all(8),
//           elevation: 8,
//           child: Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.only(bottom: 4),
//                       child: Transform(
//                           transform: Matrix4.translationValues(
//                             100.0,
//                             0.0,
//                             0.0,
//                           ),
//                           child: Column(
//                             children: [
//                               // Text(services.libelle,
//                               //     style: TextStyle(
//                               //         fontWeight: FontWeight.bold,
//                               //         fontSize: 20)),
//                             ],
//                           )),
//                     ),
//                     // Text(services.descriptif,
//                     //     style: TextStyle(color: Colors.grey[500], fontSize: 14))
//                   ],
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
// A FAIRE !

// Pour pouvoir afficher les données d'un autre table je dois :
// créer la méthode dans databasehelper
// créer une liste contenant les informations nécessaires
// Suivre les étapes et informations entrées dans le body
