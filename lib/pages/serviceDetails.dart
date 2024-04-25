import 'package:flutter/material.dart';
import 'package:trokannou/pages/services.dart';

class ServiceDetailsPage extends StatefulWidget {
  const ServiceDetailsPage({super.key});

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
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
        body: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    "images/yuka.png",
                    height: 300,
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                "Yuka Thomas",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Text("Pousses de maniocs",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                height: 200,
                width: 400,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "J'aurais besoin de 2 stacks de 64 pousses de manioc pour un projet au sein de l'ehpad AKAMANMAN de Morne-à-l'eau",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 50),
                    backgroundColor: Color(0xFFBC6C25)),
                //lien vers la page de connexion
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ServicesPage())),

                child: Text(
                  "Aider !",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
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
      ),
    );
  }
}
