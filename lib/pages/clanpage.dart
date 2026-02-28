import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yekloveguard/controller.dart/yek_controller.dart';
import 'package:yekloveguard/widget/clancard.dart';

class ClanSectionPage extends StatelessWidget {
  const ClanSectionPage({super.key});

  // Color Palette
  final Color primaryGold = const Color(0xFFECA413);
  final Color backgroundDark = const Color(0xFF121212);
  final Color backgroundLight = const Color(0xFFF8F7F6);

  @override
  Widget build(BuildContext context) {
    final YekController yekController = Get.find<YekController>();
    return GetBuilder<YekController>(
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: yekController.scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: yekController.allyekdata.length,
                  itemBuilder: (context, index) {
                    return clanCard(
                      index: index,
                      name: yekController.allyekdata[index]!.meiteimayek,
                      subtitle: yekController.allyekdata[index]!.title,
                      description: yekController.allyekdata[index]!.description,
                      icon: yekController.getYEKicons(
                        yekname: yekController.allyekdata[index]!.yekname,
                      ),
                      ykcon: yekController,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Yek Salai Clans',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'GreateVibes',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Ancient bloodline guidelines ensuring sacred compatibility and traditional harmony.',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(color: Colors.grey, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
