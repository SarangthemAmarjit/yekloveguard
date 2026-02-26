import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YekController extends GetxController {
  var yekData = <String, List<String>>{}.obs;
  var surnames = <String>[].obs;
  final TextEditingController lover1Controller = TextEditingController();
  final TextEditingController lover2Controller = TextEditingController();
  var lover1 = "".obs;
  var lover2 = "".obs;
  var result = "".obs;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  bool? isDangerous;

  @override
  void onInit() {
    super.onInit();
    loadJson();
  }

  void setselectednavindex({required int index}) {
    _selectedIndex = index;
    update();
  }

  void reset() {
    isDangerous = null;
    lover1Controller.clear();
    lover2Controller.clear();
    update();
    result.value = "";
  }

  Future<void> loadJson() async {
    final response = await rootBundle.loadString('assets/yek_data.json');

    final Map<String, dynamic> data = Map<String, dynamic>.from(
      json.decode(response),
    );

    yekData.value = data.map(
      (String key, dynamic value) =>
          MapEntry(key, List<String>.from(value as List)),
    );

    surnames.value = yekData.value.values.expand((element) => element).toList();
  }

  String? getYek(String surname) {
    surname = surname.trim().toUpperCase();

    for (var entry in yekData.entries) {
      if (entry.value.contains(surname)) {
        return entry.key;
      }
    }
    return null;
  }

  void checkCompatibility(BuildContext context) async {
    final yek1 = getYek(lover1Controller.text);
    final yek2 = getYek(lover2Controller.text);

    if (yek1 == null && yek2 == null) {
      result.value = "Surname not found in database";
      showNotFoundDialog(
        context,
        "Neither surname was found in our database. Please check your spelling and try again.",
      );
      return;
    } else if (yek1 == null) {
      result.value = "Partner 1's surname not found";
      showNotFoundDialog(
        context,
        "Partner 1's surname was not found in our database. Please check your spelling and try again.",
      );
      return;
    } else if (yek2 == null) {
      result.value = "Partner 2's surname not found";
      showNotFoundDialog(
        context,
        "Partner 2's surname was not found in our database. Please check your spelling and try again.",
      );
      return;
    }

    if (yek1 == yek2) {
      isDangerous = true;
      update();
    } else {
      isDangerous = false;
      update();
    }

    saveHistory();
  }

  void showNotFoundDialog(BuildContext context, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        icon: const Icon(Icons.search_off, size: 50, color: Colors.amber),
        title: const Text(
          "Name Not Found",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(content, textAlign: TextAlign.center),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("TRY AGAIN"),
          ),
        ],
      ),
    );
  }

  Future<void> saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList("history") ?? [];

    history.add("${lover1.value} ❤️ ${lover2.value} → ${result.value}");

    prefs.setStringList("history", history);
  }
}
