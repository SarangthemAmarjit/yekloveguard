import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yekloveguard/controller.dart/yek_controller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(YekController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yek Salai Love Checker ❤️"),
        centerTitle: true,
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  items: controller.surnames
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) =>
                      controller.lover1.value = val ?? "",
                  decoration: const InputDecoration(
                      labelText: "First Lover Surname"),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  items: controller.surnames
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) =>
                      controller.lover2.value = val ?? "",
                  decoration: const InputDecoration(
                      labelText: "Second Lover Surname"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: controller.checkCompatibility,
                  child: const Text("Check Compatibility"),
                ),
                const SizedBox(height: 30),
                if (controller.result.isNotEmpty)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: controller.isDangerous.value
                          ? Colors.red
                          : Colors.green,
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                    child: Text(
                      controller.result.value,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          )),
    );
  }
}