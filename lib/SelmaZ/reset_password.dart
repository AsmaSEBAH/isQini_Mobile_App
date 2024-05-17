import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'auth.dart';
import 'original_button1.dart';
import 'Appbar.dart';

//creation de la page de recuperation du mot de passe
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  AuthBase authbase = AuthBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Réinitialisation du mot de passe',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) => _email = value,
                    validator: (value) => EmailValidator.validate(value!) ? null : "Veuillez entrer un email valide",
                    maxLines: 1,
                    decoration: InputDecoration(
                        labelText: 'Adresse e-mail',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: 'test@gmail.com',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2, color: Color(0xffF2EDE6)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.greenAccent, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2, color: Color(0xff2AF598)),
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OriginalButton1(
                    text: 'Réinitialiser',
                    onpressed: () async {
                      try {
                        await authbase.resetPassword(_email);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'Confirmation',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                content: Text(
                                  'Nous avons envoyé un lien!verifiez votre email',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                actions: [
                                  FlatButton(
                                    child: Text(
                                      "OK",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                                    },
                                  ),
                                ],
                              );
                            });
                      } on FirebaseAuthException catch (e) {
                        print(e.code);
                        if (e.code == 'user-not-found') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'Erreur',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  content: Text('Aucun enregistrement d\'utilisateur ne correspond à cet identifiant. L\'utilisateur a peut-être été supprimé.', style: TextStyle(color: Colors.black)),
                                );
                              });
                        } else if (e.code == 'invalid-email') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("Veuillez entrer un email valide", style: TextStyle(color: Colors.black)),
                                );
                              });
                        }
                      }
                    },
                    textColor: Colors.black,
                    bgColor: Color(0xff2AF598),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
