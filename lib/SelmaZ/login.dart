import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'original_button1.dart';
import 'auth.dart';
import 'package:helloworld/asma/all.dart';
import 'reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Appbar.dart';

//creation de la page de connexion
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  bool _showPassword = false;
  String _email = '';
  String _password = '';
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
              'Connexion',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 60,
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
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) => _password = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer entrer votre mot de passe';
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
                      labelStyle: const TextStyle(color: Colors.grey),
                      hintText: '* * * * * ',
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
                  forgetPassword(context),
                  const SizedBox(
                    height: 10,
                  ),
                  OriginalButton1(
                    text: 'Se Connecter',
                    onpressed: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await authbase.loginWithEmailAndPassword(_email, _password);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('Aucun utilisateur trouvé pour cette adresse e-mail.', style: TextStyle(color: Colors.black)),
                                );
                              });
                        } else if (e.code == 'wrong-password') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('Mot de passe erroné fourni pour cet utilisateur.', style: TextStyle(color: Colors.black)),
                                );
                              });
                        } else {
                          print(e.code);
                        }
                      }
                    },
                    textColor: Colors.black,
                    bgColor: Color(0xff2AF598),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Pas de compte?', style: TextStyle(color: Colors.grey)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                        },
                        child: const Text(
                          's\'inscrire',
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

  Widget forgetPassword(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Mot de passe oublié?",
          style: TextStyle(
            color: Color(0xff2AF598),
          ),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
