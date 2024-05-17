import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
/*import 'dart:convert';

import 'icons.dart';
import 'icons2.dart';*/
import 'textfieldGeneral.dart';

class Contact_page extends StatefulWidget {
  const Contact_page({Key? key}) : super(key: key);
  _Contact_pageState createState() => _Contact_pageState();
}

class _Contact_pageState extends State<Contact_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2AF598),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        /*title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.email_outlined, color: Colors.black, size: 20),
            SizedBox(width: 5),
            Text(
              'Contactez-nous',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),*/
        title: ListTile(
          minLeadingWidth: 10,
          leading: Icon(Icons.email_outlined, color: Colors.black, size: 20),
          title: Text(
            'Contactez-nous',
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        //centerTitle: true,
      ),
      body: TextfieldGeneral(),
    );
    /* Future sendEmail({
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
          'origin':'http://localhost',
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
    }*/
  }
}
