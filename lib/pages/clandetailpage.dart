import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClanDetailPage extends StatelessWidget {
  const ClanDetailPage({super.key});

  // Theme Colors from Tailwind config
  final Color primaryGold = const Color(0xFFECA413);
  final Color backgroundDark = const Color(0xFF221C10);
  final Color backgroundLight = const Color(0xFFF8F7F6);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? backgroundDark : backgroundLight,
      appBar: AppBar(
        backgroundColor: (isDark ? backgroundDark : backgroundLight)
            .withOpacity(0.8),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: primaryGold, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Khuul Clan',
          style: GoogleFonts.notoSerif(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: primaryGold),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            _buildProfileHeader(),
            const SizedBox(height: 32),
            _buildSurnameGrid(isDark),
            const SizedBox(height: 100), // Bottom padding for Nav
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
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
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1576014131795-d440191a8e8b?auto=format&fit=crop&w=300&q=80',
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
            'The Golden Bloodline',
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
              color: primaryGold.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: primaryGold.withOpacity(0.2)),
            ),
            child: Text(
              '"Yek Salai" — Surnames within this clan share a spiritual and biological essence. Traditional guidelines prohibit unions between these names to preserve ancestral health.',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                height: 1.5,
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSurnameGrid(bool isDark) {
    final List<Map<String, String>> surnames = [
      {'letter': 'A', 'name': 'Abasi'},
      {'letter': 'A', 'name': 'Adane'},
      {'letter': 'B', 'name': 'Bakari'},
      {'letter': 'B', 'name': 'Bello'},
      {'letter': 'C', 'name': 'Chidubem'},
      {'letter': 'D', 'name': 'Diallo'},
      {'letter': 'E', 'name': 'Eze'},
      {'letter': 'F', 'name': 'Fofana'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
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
                '42 REGISTERED NAMES',
                style: GoogleFonts.notoSans(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: surnames.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: primaryGold.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: primaryGold.withOpacity(0.1)),
                ),
                child: Row(
                  children: [
                    Text(
                      surnames[index]['letter']!,
                      style: TextStyle(
                        color: primaryGold,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      surnames[index]['name']!,
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: primaryGold),
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              'View All 42 Surnames',
              style: TextStyle(color: primaryGold, fontWeight: FontWeight.bold),
            ),
          ),
        ],
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
