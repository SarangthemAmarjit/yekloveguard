import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ClanSectionPage extends StatelessWidget {
  const ClanSectionPage({super.key});

  // Color Palette
  final Color primaryGold = const Color(0xFFECA413);
  final Color backgroundDark = const Color(0xFF121212);
  final Color backgroundLight = const Color(0xFFF8F7F6);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 8),
            _buildHeader(),
            const SizedBox(height: 32),
            _clanCard(
              name: "Mangang",

              subtitle: "Supreme Lineage",
              description:
                  "The solar dynasty representing the head of the seven clans, originating from the Ningthouja era.",
              icon: Icons.wb_sunny,
              isDark: isDark,
            ),
            _clanCard(
              name: "Luwang",

              subtitle: "Architects of Grace",
              description:
                  "Known for their wisdom and administrative excellence, fostering the growth of the community.",
              icon: Icons.architecture,
              isDark: isDark,
            ),
            _clanCard(
              name: "Khuman",

              subtitle: "The Night Watch",
              description:
                  "A powerful lineage associated with strength, bravery, and the mystical elements of the deep forest.",
              icon: Icons.dark_mode,
              isDark: isDark,
            ),
            _clanCard(
              name: "Angom",

              subtitle: "Celestial Guardians",
              description:
                  "The priestly and scholarly clan, maintaining the sacred traditions and celestial records.",
              icon: Icons.auto_awesome,
              isDark: isDark,
            ),
            _clanCard(
              name: "Moirang",

              subtitle: "Spirits of the Water",
              description:
                  "Descendants of the lake regions, celebrated for their artistry, music, and cultural vibrancy.",
              icon: Icons.waves,
              isDark: isDark,
            ),
            _clanCard(
              name: "Kha Nganba",

              subtitle: "Foundations of Earth",
              description:
                  "The resilient protectors of the land, known for their agricultural mastery and grounding force.",
              icon: Icons.eco,
              isDark: isDark,
            ),
            _clanCard(
              name: "Salai Leishangthem",

              subtitle: "Harmonizers",
              description:
                  "The weavers of the social fabric, excelling in trade, diplomacy, and communal unity.",
              icon: Icons.hub,
              isDark: isDark,
            ),
            const SizedBox(height: 100), // Space for bottom nav
          ],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Yek Salai Lineage',
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSerif(
            fontSize: 32,
            fontWeight: FontWeight.bold,
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

    required String subtitle,
    required String description,
    required IconData icon,
    required bool isDark,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryGold.withOpacity(0.3)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primaryGold.withOpacity(0.1), Colors.transparent],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.toNamed('/clandetails');
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
                        style: GoogleFonts.notoSerif(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primaryGold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: primaryGold.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: isDark ? Colors.grey[400] : Colors.grey[700],
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Icon(icon, size: 40, color: primaryGold.withOpacity(0.8)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
