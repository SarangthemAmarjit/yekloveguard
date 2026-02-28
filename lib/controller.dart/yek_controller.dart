import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yekloveguard/model/yekmodel.dart';

class YekController extends GetxController {
  final TextEditingController lover1Controller = TextEditingController();
  final TextEditingController lover2Controller = TextEditingController();
  final TextEditingController searchcontroller = TextEditingController();
  var lover1 = "".obs;
  var lover2 = "".obs;
  var result = "".obs;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  int _selectedyekIndex = 0;
  int get selectedyekIndex => _selectedyekIndex;
  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;
  List<YekModel?> _allyekdata = [];
  List<YekModel?> get allyekdata => _allyekdata;
  List<String> surnames = [];
  Map<String, String> surnameToYek = {};
  List<String> _selectedsurnames = [];
  List<String> get selectedsurnames => _selectedsurnames;
  List<String> _filteredsurnames = [];
  List<String> get filteredsurnames => _filteredsurnames;

  bool? isDangerous;

  @override
  void onInit() {
    super.onInit();
    loadJson();
  }

  void setselectedyekindex({required int ind}) {
    _selectedyekIndex = ind;

    _selectedsurnames = _allyekdata[ind]!.surnames;
    _filteredsurnames = _allyekdata[ind]!.surnames;
    update();
    Get.toNamed('/clandetails');
  }

  void searchSurnames(String query) {
    log("Query : "+query);
    if (query.isEmpty) {
      _filteredsurnames = _selectedsurnames;
    } else {
      _filteredsurnames = _selectedsurnames
          .where(
            (surname) => surname.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    update();
    log("filtered List : "+_filteredsurnames.toString());
  }

  void setselectednavindex({required int index}) {
    _selectedIndex = index;
    update();
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void reset() {
    isDangerous = null;
    lover1Controller.clear();
    lover2Controller.clear();
    update();
    result.value = "";
  }

  IconData getYEKicons({required String yekname}) {
    switch (yekname) {
      case "MANGANG":
        return Icons.wb_sunny;
      case "LUWANG":
        return Icons.architecture;
      case "KHUMAN":
        return Icons.dark_mode;
      case "ANGOM":
        return Icons.auto_awesome;
      case "MOIRANG":
        return Icons.water;
      case "KHABA NGANBA":
        return Icons.terrain;
      case "SALANG LEISANGTHEM":
        return Icons.hub;
      default:
        return Icons.help_outline;
    }
  }

  Color getYEKcolor({required String yekname}) {
    switch (yekname) {
      case "MANGANG":
        return Colors.red;
      case "LUWANG":
        return Colors.white;
      case "KHUMAN":
        return Colors.black;
      case "ANGOM":
        return Colors.yellow;
      case "MOIRANG":
        return Colors.pink;
      case "KHABA NGANBA":
        return Colors.blue;
      case "SALANG LEISANGTHEM":
        return Colors.green;
      default:
        return Colors.orange;
    }
  }

  String getYEKimage({required String yekname}) {
    switch (yekname) {
      case "MANGANG":
        return "assets/images/Mangang.jpg";
      case "LUWANG":
        return "assets/images/Luwang.jpg";
      case "KHUMAN":
        return "assets/images/Khuman.jpg";
      case "ANGOM":
        return "assets/images/Angom.jpg";
      case "MOIRANG":
        return "assets/images/Moirang.jpg";
      case "KHABA NGANBA":
        return "assets/images/khabanganba.jpg";
      case "SALANG LEISANGTHEM":
        return "assets/images/salangleishang.jpg";
      default:
        return '';
    }
  }

  Future<void> loadJson() async {
    final response = await rootBundle.loadString('assets/yek_converted.json');

    _allyekdata = yekModelFromJson(response);
    update();

    surnames.clear();
    surnameToYek.clear();

    for (var yek in _allyekdata) {
      surnames.addAll(yek!.surnames);

      /// Create fast lookup map
      for (var surname in yek.surnames) {
        surnameToYek[surname.toUpperCase()] = yek.yekname;
      }
    }
  }

  String? getYek(String surname) {
    return surnameToYek[surname.trim().toUpperCase()];
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
