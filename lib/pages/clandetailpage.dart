import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yekloveguard/controller.dart/yek_controller.dart';
import 'package:yekloveguard/widget/clancard.dart';

class ClanDetailPage extends StatelessWidget {
  const ClanDetailPage({super.key});

  // Theme Colors from Tailwind config
  final Color primaryGold = const Color(0xFFECA413);
  final Color backgroundDark = const Color(0xFF221C10);
  final Color backgroundLight = const Color(0xFFF8F7F6);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final YekController yekController = Get.find<YekController>();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: (isDark ? backgroundDark : backgroundLight)
      //       .withOpacity(0.8),
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios_new, color: primaryGold, size: 20),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      //   centerTitle: true,
      //   title: Text(
      //     yekController.allyekdata[yekController.selectedyekIndex]!.meiteimayek,
      //     style: TextStyle(
      //       fontFamily: 'Leikoi',
      //       fontWeight: FontWeight.bold,
      //       fontSize: 25,
      //       color: isDark ? Colors.white : Colors.black,
      //       letterSpacing: 2,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.info_outline, color: primaryGold),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: GetBuilder<YekController>(
        builder: (_) {
          return Stack(
            children: [
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    clanCard(
                      name: yekController
                          .allyekdata[yekController.selectedyekIndex]!
                          .meiteimayek,
                      index: yekController.selectedyekIndex,
                      subtitle: yekController
                          .allyekdata[yekController.selectedyekIndex]!
                          .title,
                      description: yekController
                          .allyekdata[yekController.selectedyekIndex]!
                          .description,
                      icon: yekController.getYEKicons(
                        yekname: yekController
                            .allyekdata[yekController.selectedyekIndex]!
                            .yekname,
                      ),
                      ykcon: yekController,
                    ),
                    TextField(
                      controller: yekController.searchcontroller,
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      onChanged: (value) => yekController.searchSurnames(value),
                      decoration: InputDecoration(
                        hintText: 'Search Surname',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: isDark
                            ? Colors.white.withOpacity(0.05)
                            : Colors.white.withOpacity(0.7),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: isDark
                                ? Colors.white10
                                : const Color.fromARGB(255, 201, 200, 200),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Clan Surnames',
                          style: GoogleFonts.notoSerif(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryGold,
                          ),
                        ),
                        Text(
                          yekController.filteredsurnames.length <
                                  yekController.selectedsurnames.length
                              ? '${yekController.filteredsurnames.length} SURNAMES FOUND'
                              : '${yekController.filteredsurnames.length} REGISTERED NAMES',
                          style: GoogleFonts.notoSans(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),

                    _buildSurnameGrid(isDark, yekController),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader(YekController ykcon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: primaryGold, width: 2),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    ykcon.getYEKimage(
                      yekname:
                          ykcon.allyekdata[ykcon.selectedyekIndex]!.yekname,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: primaryGold,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'LINEAGE',
                    style: GoogleFonts.notoSans(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: backgroundDark,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            ykcon.allyekdata[ykcon.selectedyekIndex]!.title.toUpperCase(),
            style: GoogleFonts.notoSerif(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: primaryGold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 4,
            width: 60,
            decoration: BoxDecoration(
              color: primaryGold.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ykcon
                  .getYEKcolor(
                    yekname: ykcon.allyekdata[ykcon.selectedyekIndex]!.yekname,
                  )
                  .withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ykcon
                    .getYEKcolor(
                      yekname:
                          ykcon.allyekdata[ykcon.selectedyekIndex]!.yekname,
                    )
                    .withOpacity(0.7),
              ),
            ),
            child: Text(
              ykcon.allyekdata[ykcon.selectedyekIndex]!.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                height: 1.5,
                color: const Color.fromARGB(255, 0, 2, 114),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSurnameGrid(bool isDark, YekController ykcon) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ykcon.filteredsurnames.isEmpty
                ? SizedBox(
                    height: 300,
                    child: Center(
                      child: Text(
                        'No surnames found for "${ykcon.searchcontroller.text}"',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: ykcon.filteredsurnames.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: ykcon
                              .getYEKcolor(
                                yekname: ykcon
                                    .allyekdata[ykcon.selectedyekIndex]!
                                    .yekname,
                              )
                              .withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color.fromARGB(
                              255,
                              1,
                              25,
                              45,
                            ).withOpacity(0.2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            ykcon.filteredsurnames[index],
                            style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w500,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? backgroundDark : backgroundLight,
        border: Border(top: BorderSide(color: primaryGold.withOpacity(0.2))),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryGold,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.notoSerif(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: GoogleFonts.notoSerif(fontSize: 10),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shield, fill: 1),
            label: 'CLANS',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'MATCH'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
            label: 'ANCESTRY',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PROFILE'),
        ],
      ),
    );
  }
}
