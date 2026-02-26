import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YekController extends GetxController {
  var yekData = <String, List<String>>{}.obs;
  var surnames = <String>[].obs;

  var lover1 = "".obs;
  var lover2 = "".obs;
  var result = "".obs;
  var isDangerous = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadJson();
  }

  Future<void> loadJson() async {
    final response =
        await rootBundle.loadString('assets/data/yek_salai.json');

    final data = json.decode(response);

    yekData.value = data.map<String, List<String>>(
      (key, value) => MapEntry(key, List<String>.from(value)),
    );

    surnames.value =
        yekData.values.expand((element) => element).toList();
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

  void checkCompatibility() async {
    final yek1 = getYek(lover1.value);
    final yek2 = getYek(lover2.value);

    if (yek1 == null || yek2 == null) {
      result.value = "Surname not found in database";
      return;
    }

    if (yek1 == yek2) {
      isDangerous.value = true;
      result.value =
          "⚠ Dangerous!\nBoth belong to $yek1 Yek Salai";
    } else {
      isDangerous.value = false;
      result.value =
          "✅ Suitable!\nDifferent Yek Salai\n$yek1 & $yek2";
    }

    saveHistory();
  }

  Future<void> saveHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history =
        prefs.getStringList("history") ?? [];

    history.add(
        "${lover1.value} ❤️ ${lover2.value} → ${result.value}");

    prefs.setStringList("history", history);
  }
}