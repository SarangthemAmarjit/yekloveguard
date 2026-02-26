import 'dart:convert';

import 'package:flutter/services.dart';

class DataService {
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  // Map: surname uppercase -> Set of Yek names
  final Map<String, Set<String>> _surnameToYeks = {};

  Future<void> loadData() async {
    final String jsonString = await rootBundle.loadString(
      'assets/yek_data.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    jsonMap.forEach((yek, surnames) {
      for (var surname in (surnames as List)) {
        final key = surname.toString().trim().toUpperCase();
        _surnameToYeks.putIfAbsent(key, () => {}).add(yek);
      }
    });
  }

  Set<String>? getYeks(String surname) {
    return _surnameToYeks[surname.trim().toUpperCase()];
  }
}
