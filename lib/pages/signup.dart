import 'package:flutter/material.dart';
import '../Components/button.dart';
import '../Components/colors.dart';
import '../Components/textfield.dart';
import '../JSON/usager.dart';
import 'connect.dart';
import '../SQLite/database_helper.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //Controllers
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController phoneNbrController = TextEditingController();
  final TextEditingController typeUsrController = TextEditingController();
  final TextEditingController mdpController = TextEditingController();
  final TextEditingController confirmMdpController = TextEditingController();

  signUp() async {
    var res = await DatabaseHelper.instanceBDD.createUser(Usagers(
      nom: nomController.text,
      prenom: prenomController.text,
      mail: mailController.text,
      user: userController.text,
      tel: phoneNbrController.text,
      type: typeUsrController.text,
      mdp: mdpController.text,
    ));
    if (res > 0) {
      if (!mounted) return;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ConnectPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Inscription",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InputField(
                  hint: "Nom",
                  icon: Icons.person,
                  controller: nomController,
                ),
                InputField(
                  hint: "Prénom",
                  icon: Icons.person,
                  controller: prenomController,
                ),
                InputField(
                  hint: "Email",
                  icon: Icons.email,
                  controller: mailController,
                ),
                InputField(
                  hint: "Nom utilisateur",
                  icon: Icons.account_circle,
                  controller: userController,
                ),
                InputField(
                  hint: "Téléphone",
                  icon: Icons.phone,
                  controller: phoneNbrController,
                ),
                InputField(
                  hint: "Type",
                  icon: Icons.person,
                  controller: typeUsrController,
                ),
                InputField(
                  hint: "Mot de passe",
                  icon: Icons.lock,
                  controller: mdpController,
                  passwordInvisible: true,
                ),
                InputField(
                  hint: "Confirmation du mot de passe",
                  icon: Icons.lock,
                  controller: confirmMdpController,
                  passwordInvisible: true,
                ),
                const SizedBox(height: 10),
                Button(
                  label: "S'inscrire",
                  press: signUp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Vous avez un compte?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConnectPage()));
                      },
                      child: Text("Connectez-vous"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
