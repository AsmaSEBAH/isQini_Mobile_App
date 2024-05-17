//import 'package:flutter/cupertino.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TextfieldGeneralA extends StatefulWidget {
  const TextfieldGeneralA({Key? key}) : super(key: key);
  _TextfieldGeneralAState createState() => _TextfieldGeneralAState();
}

class _TextfieldGeneralAState extends State<TextfieldGeneralA> {
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => Center(
        child: ListView(
          padding: EdgeInsets.all(25),
          children: [
            const SizedBox(height: 100),
            buildEmail(),
            const SizedBox(height: 24),
            buildMsg(),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10.0),
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(150, 50),
                textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                primary: Color(0xff2AF598),
                onPrimary: Colors.black,
              ),
              onPressed: () => sendEmail(email: emailController.text, message: messageController.text),
              child: Text('إرسال'),
            ),
            //style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Color(0xff2AF598)))))),
          ],
        ),
      );
  Widget buildEmail() => TextFormField(
        validator: (value) => EmailValidator.validate(value!) ? null : "يرجى إدخال البريد الإلكتروني الصحيح",
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'name@example.com',
          prefixIcon: Icon(Icons.email_outlined),
          suffixIcon: emailController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => emailController.clear(),
                ),
          filled: true,
          border: OutlineInputBorder(
            //borderSide: BorderSide(color: Colors.transparent),
            borderSide: const BorderSide(color: Color(0xff2AF598), width: 2.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xffF2EDE6)),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xff2AF598)),
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: Color(0xffF2EDE6),
          labelText: 'البريد الإلكتروني',
          labelStyle: TextStyle(color: Colors.grey),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );
  Widget buildMsg() => TextField(
        maxLines: 7,
        controller: messageController,
        decoration: InputDecoration(
          filled: true,
          hintText: 'أدخل رسالتك',
          border: OutlineInputBorder(
            //borderSide: BorderSide(color: Colors.transparent),
            borderSide: const BorderSide(color: Color(0xff2AF598), width: 3),
            borderRadius: BorderRadius.circular(20.0),
          ),
          fillColor: Color(0xffF2EDE6),
        ),
      );

  Future sendEmail({
    required String email,
    required String message,
  }) async {
    final serviceId = 'service_8qlln89';
    final templateId = 'template_8nfvw9f';
    final userId = 'TrYoEwsQWjZUnUqEx';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_email': email,
          'user_message': message,
        },
      }),
    );
    print(response.body);
  }
}
