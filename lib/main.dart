import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yekloveguard/pages/clandetailpage.dart';
import 'package:yekloveguard/pages/mainnavigatpage.dart';

// Import your page files here if they are in separate files
// import 'home_page.dart';
// import 'check_page.dart';

void main() {
  runApp(const YekSalaiApp());
}

class YekSalaiApp extends StatelessWidget {
  const YekSalaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      // Automatically switch based on system settings
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(name: '/', page: () => const MainNavigationShell()),
        GetPage(name: '/clandetails', page: () => const ClanDetailPage()),
        // Define other routes here if needed
      ],
    );
  }
}
