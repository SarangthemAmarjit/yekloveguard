import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yekloveguard/controller.dart/yek_controller.dart';

class CompatibleResultPage extends StatefulWidget {
  const CompatibleResultPage({super.key});

  @override
  State<CompatibleResultPage> createState() => _CompatibleResultPageState();
}

class _CompatibleResultPageState extends State<CompatibleResultPage> {
  // Color Palette
  final Color primaryBlue = const Color(0xFF135BEC);

  final Color successGreen = const Color(0xFF10B981);

  final Color accentGold = const Color(0xFFFBBF24);

  final Color backgroundDark = const Color(0xFF101622);

  final Color backgroundLight = const Color(0xFFF6F6F8);
  @override
  void initState() {
    super.initState();
    Get.find<YekController>().loadInterstitialAd(); // 👈 CALL HERE
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final YekController ykcon = Get.find<YekController>();
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildSuccessVisual(isDark),
                const SizedBox(height: 40),
                _buildSuccessText(isDark),
              ],
            ),
          ),
        ),
        _buildActionButtons(isDark, ykcon),
      ],
    );
  }

  Widget _buildSuccessVisual(bool isDark) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Blur Effect
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              color: successGreen.withOpacity(isDark ? 0.05 : 0.1),
              shape: BoxShape.circle,
            ),
          ),
          // Main Gradient Circle
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: accentGold.withOpacity(0.3), width: 4),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  successGreen.withOpacity(0.2),
                  accentGold.withOpacity(0.1),
                ],
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Overlapping Hearts
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_heartCircle(isDark), _heartCircle(isDark)],
                  ),
                ),
                // Verified Badge
                Positioned(
                  top: -10,
                  right: -10,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: accentGold,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.verified,
                      color: Color(0xFF101622),
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _heartCircle(bool isDark) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFF101622),
        shape: BoxShape.circle,
        border: Border.all(color: accentGold, width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Icon(Icons.favorite, color: accentGold, size: 50),
    );
  }

  Widget _buildSuccessText(bool isDark) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: successGreen.withOpacity(0.2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            'TRADITION APPROVED',
            style: TextStyle(
              color: successGreen,
              fontWeight: FontWeight.w900,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Compatible Match',
          style: GoogleFonts.manrope(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
            color: isDark ? Colors.white : const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.manrope(
                fontSize: 18,
                height: 1.5,
                color: isDark ? Colors.white60 : Colors.black54,
              ),
              children: [
                const TextSpan(
                  text:
                      'Your Yek Salais are different. Your relationship is considered ',
                ),
                TextSpan(
                  text: 'safe and suitable',
                  style: TextStyle(
                    color: successGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: ' according to tradition.'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(bool isDark, YekController ykcon) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              ykcon.reset();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Check Another Pair'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryBlue,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              elevation: 8,
              shadowColor: primaryBlue.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
            label: const Text('Save to History'),
            style: TextButton.styleFrom(
              backgroundColor: isDark
                  ? Colors.white10
                  : Colors.black.withOpacity(0.05),
              foregroundColor: isDark ? Colors.white : Colors.black,
              minimumSize: const Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
