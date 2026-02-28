import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yekloveguard/constant/constantcol.dart';
import 'package:yekloveguard/controller.dart/yek_controller.dart';
import 'package:yekloveguard/widget/clancard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final YekController yekController = Get.find<YekController>();
    return GetBuilder<YekController>(
      builder: (_) {
        return Stack(
          children: [
            // Background Pattern Simulation
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  CarouselSlider.builder(
                    itemCount: yekController.allyekdata.length,
                    itemBuilder: (context, index, realIndex) {
                      return clanCard(
                        index: index,
                        name: yekController.allyekdata[index]!.meiteimayek,
                        subtitle: yekController.allyekdata[index]!.title,
                        description:
                            yekController.allyekdata[index]!.description,
                        icon: yekController.getYEKicons(
                          yekname: yekController.allyekdata[index]!.yekname,
                        ),
                        ykcon: yekController,
                      );
                    },
                    options: CarouselOptions(
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 800,
                      ),
                      height: 230,
                      enlargeCenterPage: true,
                      viewportFraction: 0.87,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      scrollPhysics: const BouncingScrollPhysics(),
                    ),
                  ),

                  _buildHeroHeader(),
                  _buildVerificationCard(),
                  if (yekController.isBannerLoaded)
                    Container(
                      alignment: Alignment.center,
                      child: AdWidget(ad: yekController.myBanner!),
                      width: yekController.myBanner!.size.width.toDouble(),
                      height: yekController.myBanner!.size.height.toDouble(),
                    ),
                  // _buildGridSections(),
                  // _buildRecentActivity(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeroHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      child: Column(
        children: [
          Text(
            'Preserving Lineage',
            style: GoogleFonts.playfairDisplay(
              fontSize: 32,
              fontStyle: FontStyle.italic,
              color: charcoal,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'ANCIENT WISDOM FOR MODERN UNIONS',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationCard() {
    final YekController ykcon = Get.find<YekController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderGold),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 30,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              // Dark Header Section of Card
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: charcoal,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/images/heroimage2.jpg',

                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'OFFICIAL GUIDELINES',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: mutedGold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Text Content
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lineage Verification',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ensure ancestral compatibility by verifying clan lineage across seven generations.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      height: 54,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [mutedGold, Color(0xFFA68042)],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: mutedGold.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          ykcon.setselectednavindex(index: 1);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'BEGIN VERIFICATION',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridSections() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DISCOVER & LEARN',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: charcoal,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _gridItem(Icons.auto_stories, 'Traditions', '7-generation rule'),
              const SizedBox(width: 16),
              _gridItem(
                Icons.history_edu,
                'Records',
                '500 years of history',
                isItalic: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _gridItem(
    IconData icon,
    String title,
    String sub, {
    bool isItalic = false,
  }) {
    return Expanded(
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderGold),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: mutedGold, size: 28),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              sub,
              style: TextStyle(
                fontSize: 11,
                color: Colors.black45,
                fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'RECENT ACTIVITY',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              Text(
                'VIEW ALL',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: mutedGold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _activityTile(
            'Kumar & Sharma',
            '2 hours ago',
            'Compatible',
            Colors.greenAccent,
            Icons.check_circle,
          ),
          const SizedBox(height: 12),
          _activityTile(
            'Patel & Negi',
            'Yesterday',
            'Caution',
            Colors.amber,
            Icons.error_outline,
          ),
        ],
      ),
    );
  }

  Widget _activityTile(
    String names,
    String time,
    String status,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderGold),
      ),
      child: Row(
        children: [
          // Overlapping Avatars
          SizedBox(
            width: 55,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: charcoal,
                  child: Text(
                    names[0],
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: cream,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: borderGold),
                      ),
                      child: Center(
                        child: Text(
                          names.split(' & ')[1][0],
                          style: GoogleFonts.playfairDisplay(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  names,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  time.toUpperCase(),
                  style: const TextStyle(fontSize: 9, color: Colors.black26),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                status.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Icon(icon, color: color, size: 18),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: borderGold)),
      ),
      padding: const EdgeInsets.only(top: 12, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home, 'Home', isActive: true),
          _navItem(Icons.manage_search, 'Check'),
          _navItem(Icons.history, 'History'),
          _navItem(Icons.hub, 'Clans'),
          _navItem(Icons.person, 'Profile'),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? mutedGold : Colors.black26, size: 26),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: isActive ? mutedGold : Colors.black26,
          ),
        ),
      ],
    );
  }
}
