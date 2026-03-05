import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yekloveguard/controller.dart/yek_controller.dart';
import 'package:yekloveguard/pages/clandetailpage.dart';
import 'package:yekloveguard/pages/mainnavigatpage.dart';
import 'package:yekloveguard/pages/splash_screen.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // ✅ Enable edge-to-edge (Android 15 safe)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // ✅ Make system bars transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  await MobileAds.instance.initialize();

  Get.put(YekController());
  Get.find<YekController>().loadAppOpenAd();
  Get.find<YekController>().initializeBannerAd();
  Get.find<YekController>().loadInterstitialAd();

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
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/navpage', page: () => const MainNavigationShell()),
        GetPage(name: '/clandetails', page: () => const ClanDetailPage()),
        // Define other routes here if needed
      ],
    );
  }
}
