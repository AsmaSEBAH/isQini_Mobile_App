import 'package:flutter/material.dart';

//Creation du bouton de retour en arriere
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black), // set backbutton color here which will reflect in all screens.
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
