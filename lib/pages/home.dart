import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trokannou/pages/signup.dart';
import 'connect.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFDDA15E),
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 110, right: 10, left: 10)),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text('Nou kontan vwè-w asi',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  'TRÔK AN NOU',
                  style: GoogleFonts.inter(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image(image: AssetImage('images/plantes.png')),
              SizedBox(height: 40),
              Container(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(320, 50),
                          backgroundColor: Color(0xFFBC6C25)),
                      //lien vers la page de connexion
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConnectPage())),

                      child: Text(
                        "Kontinyé",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
                margin: const EdgeInsets.symmetric(vertical: 0),
                height: 80,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      child: Image(image: AssetImage('images/iconGoogle.png')),
                    ),
                    Container(
                      child: Image(image: AssetImage('images/iconApple.png')),
                    ),
                    Container(
                      child:
                          Image(image: AssetImage('images/iconFacebook.png')),
                    ),
                    // Image(image: AssetImage('images/iconGoogle.png')),
                    // Image(image: AssetImage('images/iconApple.png')),
                    // Image(image: AssetImage('images/iconFacebook.png')),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Vous n'avez pas de compte ?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup.dart');
                      },
                      child: Text(
                        "Inscrivez-vous",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
