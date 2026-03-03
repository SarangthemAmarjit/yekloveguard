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
    bool isDark = Theme.of(context).brightness == Brightness.dark;
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
                  colorFilter: ColorFilter.mode(
                    isDark ? Colors.black.withOpacity(0.2) : Colors.transparent,
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
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
                  SizedBox(height: 20),
                  yekController.isBannerLoaded
                      ? Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),

                            height: yekController.myBanner!.size.height
                                .toDouble(),
                            width: yekController.myBanner!.size.width
                                .toDouble(),
                            child: AdWidget(ad: yekController.myBanner!),
                          ),
                        )
                      : SizedBox(),

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
}
