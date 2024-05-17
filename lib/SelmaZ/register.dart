import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/asma/all.dart';
import 'login.dart';
import 'auth.dart';
import 'original_button1.dart';
import 'Appbar.dart';
import 'profile.dart';

//creation de la page d'inscription
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String _email = '';
  String _username = '';
  String _password = '';
  String _confpassword = '';
  String error = '';

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
              'Inscription',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) => _username = value,
                    validator: (value) => value!.isEmpty ? 'Veuillez entrer un nom valide' : null,
                    maxLines: 1,
                    decoration: InputDecoration(
                        labelText: 'Nom d\'utilisateur',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: 'Nom d\'utilisateur',
                        prefixIcon: const Icon(
                          Icons.person,
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
                    height: 15,
                  ),
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
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (value) => _password = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 's\'il vous plait entrez votre mot de passe';
                      } else if (value.length < 8) {
                        return 'Le mot de passe doit comporter au moins 8 caractères.';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'Mot de passe',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: '* * * * *',
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
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        child: Icon(
                          _showPassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    obscureText: !_showPassword,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (value) => _confpassword = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 's\'il vous plait entrez votre mot de passe';
                      } else if (value != _password) {
                        return 'Le mot de passe ne correspond pas.';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'Confirmer le mot de passe',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'Confirmer le mot de passe',
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
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        child: Icon(
                          _showPassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    obscureText: !_showPassword,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OriginalButton1(
                    text: 'S\'inscrire',
                    onpressed: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await authbase.registerWithEmailAndPassword(_username, _email, _password);
                          /*assert(result.uid != null);
                          _email = result.email;
                          _username = result.displayName;*/
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                        }
                      } on FirebaseException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('L\'adresse e-mail est déjà utilisée par un autre compte.', style: TextStyle(color: Colors.black)),
                                );
                              });
                        }
                      }
                    },
                    textColor: Colors.black,
                    bgColor: Color(0xff2AF598),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Avez-vous un compte?', style: TextStyle(color: Colors.grey)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                        },
                        child: const Text(
                          'se connecter',
                          style: TextStyle(
                            color: Color(0xff2AF598),
                          ),
                        ),
                      ),
                    ],
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
