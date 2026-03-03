import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yekloveguard/constant/constantcol.dart';
import 'package:yekloveguard/controller.dart/yek_controller.dart';
import 'package:yekloveguard/pages/badresultpage.dart';
import 'package:yekloveguard/pages/goodresultpage.dart';

class CompatibilityCheckPage extends StatefulWidget {
  const CompatibilityCheckPage({super.key});

  @override
  State<CompatibilityCheckPage> createState() => _CompatibilityCheckPageState();
}

class _CompatibilityCheckPageState extends State<CompatibilityCheckPage> {
  final Color primaryBlue = mutedGold;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    final YekController ykcon = Get.put(YekController());

    return GetBuilder<YekController>(
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                isDark ? Colors.black.withOpacity(0.5) : Colors.transparent,
                BlendMode.darken,
              ),
            ),
          ),
          child: SafeArea(
            child: ykcon.isDangerous != null
                ? ykcon.isDangerous!
                      ? IncompatibleResultPage()
                      : const CompatibleResultPage()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 32),
                            _buildHeaderIcon(isDark),
                            const SizedBox(height: 24),
                            _buildHeaderText(isDark),
                            const SizedBox(height: 40),
                            _buildSurnameInput(
                              label: "Partner 1 Surname",
                              hint: "Nangi yumnak Mensanlo",
                              icon: Icons.person_outline,
                              isDark: isDark,
                              controller: ykcon.lover1Controller,
                              validatorcontent:
                                  "Please enter Partner 1's surname",
                            ),
                            _buildDivider(isDark),
                            _buildSurnameInput(
                              label: "Partner 2 Surname",
                              hint: "Noi Sai gi Yumnak Mensanlo",
                              icon: Icons.person_3_rounded,
                              isDark: isDark,
                              controller: ykcon.lover2Controller,
                              validatorcontent:
                                  "Please enter Partner 2's surname",
                            ),
                            const SizedBox(height: 40),
                            _buildInfoBox(isDark),
                            const SizedBox(height: 40),
                            _buildActionButton(ykcon, isDark),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildHeaderIcon(bool isDark) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: primaryBlue.withOpacity(isDark ? 0.15 : 0.1),
        shape: BoxShape.circle,
        border: Border.all(color: primaryBlue.withOpacity(isDark ? 0.4 : 0.2)),
      ),
      child: Icon(Icons.family_restroom, color: primaryBlue, size: 40),
    );
  }

  Widget _buildHeaderText(bool isDark) {
    return Column(
      children: [
        Text(
          'Surname Verification',
          style: GoogleFonts.manrope(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: isDark ? Colors.white : const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.manrope(
              fontSize: 14,
              height: 1.5,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
            children: [
              const TextSpan(
                text:
                    'Ensure biological and traditional compatibility based on ',
              ),
              TextSpan(
                text: 'Yek Salai',
                style: TextStyle(
                  color: primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: ' guidelines to maintain sacred lineage boundaries.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSurnameInput({
    required String label,
    required String hint,
    required IconData icon,
    required bool isDark,
    required TextEditingController controller,
    required String validatorcontent,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white70 : const Color(0xFF334155),
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return validatorcontent;
            }
            return null;
          },
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(icon, color: Colors.grey),
            filled: true,
            fillColor: isDark ? const Color(0xFF1E293B) : Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark
                    ? Colors.white24
                    : const Color.fromARGB(255, 201, 200, 200),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primaryBlue, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Divider(
            color: isDark ? Colors.white24 : Colors.grey.withOpacity(0.2),
          ),
          Icon(Icons.favorite, color: primaryBlue.withOpacity(0.4), size: 20),
        ],
      ),
    );
  }

  Widget _buildInfoBox(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.white24 : Colors.grey.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: primaryBlue, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'According to traditional norms, shared surnames or specific clan matches may require further investigation by elders.',
              style: GoogleFonts.manrope(
                fontSize: 12,
                color: isDark ? Colors.white70 : Colors.black54,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(YekController ykcon, bool isDark) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ykcon.checkCompatibility(context);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        shadowColor: isDark ? Colors.black : primaryBlue.withOpacity(0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Check Compatibility',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.analytics_outlined, color: Colors.white),
        ],
      ),
    );
  }
}
