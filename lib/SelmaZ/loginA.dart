import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'registerA.dart';
import 'original_button1.dart';
import 'auth.dart';
import 'reset_passwordA.dart';
import 'Appbar.dart';

import 'profileA.dart';

//creation de la page de connexion
class LoginPageA extends StatefulWidget {
  const LoginPageA({Key? key}) : super(key: key);

  @override
  State<LoginPageA> createState() => _LoginPageAState();
}

class _LoginPageAState extends State<LoginPageA> {
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
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: Text(
                'تسجيل الدخول',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
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
                    validator: (value) => EmailValidator.validate(value!) ? null : "الرجاء إدخال البريد الإلكتروني الصحيح",
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'البريد الإلكتروني',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: 'test@gmail.com',
                        suffixIcon: const Icon(
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
                  TextFormField(
                    onChanged: (value) => _password = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال كلمة المرور الخاصة بك';
                      }
                      return null;
                    },
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.lock_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'كلمة المرور',
                      labelStyle: TextStyle(color: Colors.grey),
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
                      prefixIcon: GestureDetector(
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
                    text: 'الإتصال',
                    onpressed: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await authbase.loginWithEmailAndPassword(_email, _password);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileA()));
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("لم يتم العثور على مستخدم لهذا البريد الإلكتروني.", textAlign: TextAlign.right, style: TextStyle(color: Colors.black)),
                                );
                              });
                        } else if (e.code == 'wrong-password') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('كلمة مرور خاطئة المقدمة لهذا المستخدم.', textAlign: TextAlign.right, style: TextStyle(color: Colors.black)),
                                );
                              });
                        }
                      }
                    },
                    textColor: Colors.black,
                    bgColor: Colors.greenAccent.shade400,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPageA(),
                            ),
                          );
                        },
                        child: const Text(
                          'تسجيل',
                          style: TextStyle(color: Color(0xFF00E676)),
                        ),
                      ),
                      const Text('ليس لديك حساب؟', style: TextStyle(color: Colors.grey)),
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
      alignment: Alignment.bottomLeft,
      child: TextButton(
        child: const Text(
          "هل نسيت كلمة المرور؟",
          textAlign: TextAlign.left,
          style: TextStyle(color: Color(0xFF00E676)),
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordA())),
      ),
    );
  }
}
