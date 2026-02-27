import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yekloveguard/controller.dart/yek_controller.dart';

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
                    return _clanCard(
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

  Widget _clanCard({
    required String name,
    required int index,
    required String subtitle,
    required String description,
    required IconData icon,
    required YekController ykcon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 44, 78).withOpacity(0.3),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ykcon
                .getYEKcolor(yekname: ykcon.allyekdata[index]!.yekname)
                .withOpacity(0.2),
            Colors.transparent,
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ykcon.setselectedyekindex(ind: index);
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontFamily: 'Leikoi',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primaryGold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: const Color.fromARGB(255, 0, 44, 78),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Colors.grey[700],
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Card(
                  elevation: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      ykcon.getYEKimage(
                        yekname: ykcon.allyekdata[index]!.yekname,
                      ),

                      height: 150,
                    ),
                  ),
                ),
                // Icon(icon, size: 40, color: primaryGold.withOpacity(0.8)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
