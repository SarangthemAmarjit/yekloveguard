import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yekloveguard/pages/homescreen.dart';
import 'package:yekloveguard/pages/mainnavigatpage.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //wait for some time on splash & then move to next screen
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() =>
          const MainNavigationShell());
    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing device size
    

    return Scaffold(
        //body
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        'assets/images/splash.gif',
        fit: BoxFit.cover,
      ),
    ));
  }
}
