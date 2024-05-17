import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'loginA.dart';
import 'auth.dart';
import 'original_button1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profileA.dart';
import 'Appbar.dart';

//creation de la page d'inscription
class RegisterPageA extends StatefulWidget {
  const RegisterPageA({Key? key}) : super(key: key);

  @override
  State<RegisterPageA> createState() => _RegisterPageAState();
}

class _RegisterPageAState extends State<RegisterPageA> {
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
              'التسجيل',
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
                    validator: (value) => value!.isEmpty ? 'الرجاء ادخال اسم مستخدم صحيح' : null,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        labelText: 'اسم المستخدم',
                        labelStyle: TextStyle(color: Colors.grey),
                        hintText: 'اسم المستخدم',
                        suffixIcon: const Icon(
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
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (value) => _password = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال كلمة المرور الخاصة بك';
                      } else if (value.length < 8) {
                        return '.يجب أن تتكون كلمة المرور من ثمانية أحرف على الأقل';
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
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (value) => _confpassword = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال كلمة المرور الخاصة بك';
                      } else if (value != _password) {
                        return '.كلمة المرور غير متطابقة';
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
                      labelText: 'تأكيد كلمة المرور',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'تأكيد كلمة المرور',
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
                  const SizedBox(
                    height: 15,
                  ),
                  OriginalButton1(
                    text: 'تسجيل',
                    onpressed: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await authbase.registerWithEmailAndPassword(_username, _email, _password);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileA()));
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(".عنوان البريد الإلكتروني قيد الاستخدام بالفعل من قبل حساب آخر", textAlign: TextAlign.right, style: TextStyle(color: Colors.black)),
                                );
                              });
                        }
                      }
                    },
                    textColor: Colors.black,
                    bgColor: Colors.greenAccent.shade400,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPageA(),
                            ),
                          );
                        },
                        child: const Text(
                          'الاتصال',
                          style: TextStyle(color: Color(0xFF00E676)),
                        ),
                      ),
                      const Text('هل لديك حساب؟', style: TextStyle(color: Colors.grey)),
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
