import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yekloveguard/controller.dart/yek_controller.dart';

class IncompatibleResultPage extends StatefulWidget {
  const IncompatibleResultPage({super.key});

  @override
  State<IncompatibleResultPage> createState() => _IncompatibleResultPageState();
}

class _IncompatibleResultPageState extends State<IncompatibleResultPage> {
  // Theme Colors
  final Color dangerRed = const Color(0xFFEF4444);

  final Color warningOrange = const Color(0xFFF59E0B);

  final Color primaryBlue = Color(0xFFC5A059);

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

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                _buildWarningVisual(isDark),
                const SizedBox(height: 32),
                _buildWarningText(isDark),
              ],
            ),
          ),
        ),
        _buildActionButtons(context),
      ],
    );
  }

  Widget _buildWarningVisual(bool isDark) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 350),

      decoration: BoxDecoration(
        color: dangerRed.withOpacity(0.1),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: dangerRed.withOpacity(0.2)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  dangerRed.withOpacity(0.1),
                  Colors.transparent,
                  warningOrange.withOpacity(0.05),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: dangerRed.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.shield, size: 80, color: dangerRed),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _statusBadge('INCOMPATIBLE', dangerRed),
                    const SizedBox(width: 8),
                    _statusBadge('YEK SALAI MATCH', warningOrange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildWarningText(bool isDark) {
    return Column(
      children: [
        Text(
          'Warning: Same Yek Salai',
          style: GoogleFonts.manrope(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: isDark ? Colors.white : const Color(0xFF0F172A),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: dangerRed.withOpacity(0.1),
            border: Border(left: BorderSide(color: dangerRed, width: 4)),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Text(
            'These surnames belong to the same bloodline. In this tradition, you are considered brother and sister. A relationship is not advised.',
            style: GoogleFonts.manrope(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white70 : Colors.black87,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final YekController ykcon = Get.find<YekController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: ElevatedButton.icon(
        onPressed: () => ykcon.reset(),
        icon: const Icon(Icons.refresh),
        label: const Text('Check New Surnames'),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          elevation: 4,
        ),
      ),
    );
  }
}
