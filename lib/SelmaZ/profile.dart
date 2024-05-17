import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth.dart';
import 'original_button2.dart';

//creation du profil de l'utilisateur
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  String email = '';
  String username = '';
  String uid = '';
  AuthBase authbase = AuthBase();
  //PickedFile _imageFile = new PickedFile();
  //final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  Future<void> _getUsername() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentReference _doc = FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid);

    await _doc.get().then((datasnapshot) {
      setState(() {
        username = (datasnapshot["nomUtilisateur"]).toString();
      });
    });
  }

  void initState() {
    super.initState();
    _getEmail();
    _getUsername();
  }

  Future<void> _getEmail() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentReference _doc = FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid);

    await _doc.get().then((datasnapshot) {
      setState(() {
        email = (datasnapshot["email"]).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: Color(0xff2AF598)),
              clipper: getClipper(),
            ),
            Positioned(
                width: MediaQuery.of(context).size.width,
                top: MediaQuery.of(context).size.height / 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(color: Colors.grey, image: DecorationImage(image: NetworkImage('https://image.shutterstock.com/image-vector/person-icon-600w-282598823.jpg'), alignment: Alignment.center, fit: BoxFit.cover), borderRadius: BorderRadius.all(Radius.circular(75.0)), boxShadow: [
                        BoxShadow(blurRadius: 7.0, color: Colors.black)
                      ]),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet()),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      username.toString(),
                      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      email.toString(),
                      style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic, fontFamily: 'Montserrat', color: Colors.grey),
                    ),
                    SizedBox(height: 45.0),
                    OriginalButton2(
                      text: "Nom d'utilisateur",
                      onpressed: () async {
                        _userEditBottomSheet(context);
                      },
                      textColor: Colors.black,
                      bgColor: Color(0xff2AF598),
                    ),
                    SizedBox(height: 15.0),
                    OriginalButton2(
                      text: 'Mot de passe',
                      onpressed: () async {
                        _passwordEditBottomSheet(context);
                      },
                      textColor: Colors.black,
                      bgColor: Color(0xff2AF598),
                    ),
                  ],
                ))
          ],
        ));
  }

  void _userEditBottomSheet(BuildContext context) {
    String _username = '';
    String uid = '';
    AuthBase authbase = AuthBase();
    final _formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Changer le nom d\'utilisateur"),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.cancel),
                                color: Color(0xff2AF598),
                                iconSize: 25,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        helperText: "Nom d\'utilisateur",
                                      ),
                                      onChanged: (value) => _username = value,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez saisir votre nom d\'utilisateur';
                                        }
                                        return null;
                                      },
                                    )),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                child: Text('Modifier'),
                                color: Color(0xff2AF598),
                                textColor: Colors.black,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      await authbase.changeUsername(_username);
                                      Navigator.pop(context);
                                    } on FirebaseAuthException catch (e) {
                                      print(e.code);
                                    }
                                  }
                                },
                              )
                            ],
                          ),
                        ],
                      )),
                ])));
      },
    );
  }

  void _passwordEditBottomSheet(BuildContext context) {
    String _password = '';
    String uid = '';
    AuthBase authbase = AuthBase();
    final _formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Changer le mot de passe"),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.cancel),
                                color: Color(0xff2AF598),
                                iconSize: 25,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        helperText: "Mot de passe",
                                      ),
                                      onChanged: (value) => _password = value,
                                      validator: (value) {
                                        if (value == null || value.isEmpty || value.length < 8) {
                                          return 'Votre mot de passe doit contenir au moins 8 caracteres.';
                                        }
                                        return null;
                                      },
                                    )),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                child: Text('Modifier'),
                                color: Color(0xff2AF598),
                                textColor: Colors.black,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      await authbase.changePassword(_password);
                                      Navigator.pop(context);
                                    } on FirebaseAuthException catch (e) {
                                      print(e.code);
                                    }
                                  }
                                },
                              )
                            ],
                          ),
                        ],
                      )),
                ])));
      },
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                //takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                // takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  /*void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }*/
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
