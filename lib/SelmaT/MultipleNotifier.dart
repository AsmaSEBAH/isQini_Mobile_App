import 'package:flutter/material.dart';
import 'data.dart';

class SingleNotifier extends ChangeNotifier {
  String _currentDay = days[0];
  SingleNotifier();

  String get currentDay => _currentDay;

  updateDay(String value) {
    if (value != _currentDay) {
      _currentDay = value;
      notifyListeners();
    }
  }
}
