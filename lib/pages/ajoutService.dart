import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trokannou/pages/services.dart';

class ajoutService extends StatefulWidget {
  const ajoutService({super.key});

  @override
  State<ajoutService> createState() => _ajoutServiceState();
}

class _ajoutServiceState extends State<ajoutService> {
  static var _proposition = ['Service', 'Besoin'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 60)),
              Text(
                "Un service ?\n Un besoin ?",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
                textAlign: TextAlign.center,
              ),
              ListTile(
                title: DropdownButton(
                    items: _proposition.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    value: 'Service',
                    onChanged: (valueSelectedByUser) {
                      setState(() {
                        debugPrint(
                            'Vous avez sélectionné $valueSelectedByUser');
                      });
                    }),
              ),
              Padding(padding: EdgeInsets.only(top: 60)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: titleController,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      debugPrint('Titre ajouté');
                    },
                    decoration: InputDecoration(
                        labelText: 'Titre',
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.white))),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: descriptionController,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      debugPrint('Description ajouté');
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                style: BorderStyle.solid, color: Colors.white)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 90.0, horizontal: 20.0)),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(320, 50),
                    backgroundColor: Color(0xFFBC6C25)),
                //lien vers la page de connexion
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ServicesPage())),

                child: Text(
                  "Soumettre",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
