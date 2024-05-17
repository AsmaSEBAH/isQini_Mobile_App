import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'loginA.dart';
import 'auth.dart';
import 'original_button1.dart';
import 'Appbar.dart';

//creation de la page de recuperation du mot de passe
class ResetPasswordA extends StatefulWidget {
  const ResetPasswordA({Key? key}) : super(key: key);

  @override
  State<ResetPasswordA> createState() => _ResetPasswordAState();
}

class _ResetPasswordAState extends State<ResetPasswordA> {
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
              'إعادة تعيين كلمة المرور',
              textAlign: TextAlign.left,
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
                    validator: (value) => EmailValidator.validate(value!) ? null : "الرجاء إدخال البريد الإلكتروني الصحيح",
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
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
                  OriginalButton1(
                    text: 'إعادة التعيين',
                    onpressed: () async {
                      try {
                        await authbase.resetPassword(_email);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'تأكيد',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                content: Text(
                                  'لقد أرسلنا رابط! تحقق من بريدك الإلكتروني',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                actions: [
                                  FlatButton(
                                    child: Text(
                                      'تم',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPageA()));
                                    },
                                  ),
                                  SizedBox(width: 150),
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
                                    'خطأ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  content: Text('لا يوجد سجل مستخدم يتوافق مع هذا المعرف. ربما تم حذف المستخدم.', textAlign: TextAlign.right, style: TextStyle(color: Colors.black)), //e.message.toString()
                                );
                              });
                        } else if (e.code == 'invalid-email') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("الرجاء إدخال البريد الإلكتروني الصحيح", textAlign: TextAlign.right, style: TextStyle(color: Colors.black)),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
