import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yekloveguard/constant/constantcol.dart';
import 'package:yekloveguard/controller.dart/yek_controller.dart';
import 'package:yekloveguard/pages/about.dart';
import 'package:yekloveguard/pages/checkpage.dart';
import 'package:yekloveguard/pages/clanpage.dart';
import 'package:yekloveguard/pages/homescreen.dart';

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  // List of screens to navigate between
  final List<Widget> _pages = [
    const HomeScreen(), // Page 0 (Index from your first request)
    const CompatibilityCheckPage(), // Page 1 (Index from your second request)
    const ClanSectionPage(), // Placeholder for Page 2
    const AboutScreen(), // Placeholder for Page 3
  ];

  @override
  Widget build(BuildContext context) {
    final YekController ykcon = Get.put(YekController());
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    const Color primaryBlue = Color(0xFF135BEC);
    const Color mutedGold = Color(0xFFC5A059);

    return GetBuilder<YekController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: cream.withOpacity(0.8),
            elevation: 0,

            centerTitle: true,
            title: Text(
              'Yek Love Checker',
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.bold,
                color: charcoal,
                fontSize: 20,
              ),
            ),
            actions: [
              Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_none, color: charcoal),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                      height: 6,
                      width: 6,
                      decoration: const BoxDecoration(
                        color: mutedGold,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // IndexedStack keeps the state of pages alive
          body: IndexedStack(index: ykcon.selectedIndex, children: _pages),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF101622) : Colors.white,
              border: Border(
                top: BorderSide(
                  color: isDark ? Colors.white10 : Colors.grey.shade200,
                ),
              ),
            ),
            padding: const EdgeInsets.only(top: 10, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, "Home", 0, mutedGold, ykcon),
                _buildNavItem(Icons.favorite, "Check", 1, mutedGold, ykcon),
                _buildNavItem(Icons.groups_sharp, "Clans", 2, mutedGold, ykcon),
                _buildNavItem(
                  Icons.perm_device_information,
                  "About",
                  3,
                  mutedGold,
                  ykcon,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    Color activeColor,
    YekController ykcon,
  ) {
    bool isActive = ykcon.selectedIndex == index;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Choose color based on state
    Color color = isActive
        ? activeColor
        : (isDark ? Colors.white38 : Colors.grey);

    return GestureDetector(
      onTap: () => ykcon.setselectednavindex(index: index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 4),
            Text(
              label.toUpperCase(),
              style: GoogleFonts.manrope(
                fontSize: isActive ? 11 : 10,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w800,
                letterSpacing: 0.5,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
