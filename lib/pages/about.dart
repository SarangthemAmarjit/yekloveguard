import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  // Defining the color palette from the Tailwind config
  static const Color obsidian = Color(0xFF0A0A0A);
  static const Color primary = Color(0xFFD4AF37);
  static const Color neutralDark = Color(0xFF1A1A1A);
  static const Color ivory = Color(0xFFFFFFF0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          // Header Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                color: neutralDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: primary.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: primary.withOpacity(0.05),
                    blurRadius: 24,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.stars, color: primary, size: 72),
                  const SizedBox(height: 24),
                  const Text(
                    'Yek Love Checker',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'serif',
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'GUARDIANS OF MEITEI HERITAGE',
                    style: TextStyle(
                      color: primary.withOpacity(0.7),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 4,
                        decoration: BoxDecoration(
                          color: primary.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 48,
                        height: 4,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 32,
                        height: 4,
                        decoration: BoxDecoration(
                          color: primary.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Our Heritage Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Our Heritage',
                      style: TextStyle(
                        color: primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              primary.withOpacity(0.4),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: const Color.fromARGB(
                        255,
                        18,
                        22,
                        65,
                      ).withOpacity(0.8),
                      fontSize: 16,
                      height: 1.5,
                    ),
                    children: const [
                      TextSpan(
                        text:
                            'Yek Love Checker is more than a compatibility app; it is a digital sanctuary for the ancient ',
                      ),
                      TextSpan(
                        text: 'Meitei heritage',
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            '. In the heart of Manipur, the identity of an individual is woven into their lineage, traced back through centuries of history.',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.05),
                    border: const Border(
                      left: BorderSide(color: primary, width: 2),
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: const Text(
                    '"We honor the wisdom of our ancestors by ensuring that the sacred threads of our lineage remain untangled and pure for generations to come."',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 18, 22, 65),
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // The Sacred Seven Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.account_balance,
                      color: primary,
                    ), // Alternative to 'shrine'
                    SizedBox(width: 8),
                    Text(
                      'The Sacred Seven',
                      style: TextStyle(
                        color: primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: const Color.fromARGB(
                        255,
                        18,
                        22,
                        65,
                      ).withOpacity(0.8),
                      fontSize: 16,
                      height: 1.5,
                    ),
                    children: const [
                      TextSpan(
                        text: 'The Meitei community is structured around the ',
                      ),
                      TextSpan(
                        text: '7 Yek Salais',
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' (clans). These are not merely surnames, but the very pillars of our social and spiritual existence:',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Sacred Seven Cards
                _buildSacredCard(
                  icon: Icons.account_tree,
                  title: 'Ancestral Lineage',
                  description:
                      'Each Yek represents a unique ancestor, ensuring that the roots of every family tree are documented and respected.',
                ),
                const SizedBox(height: 16),
                _buildSacredCard(
                  icon: Icons.diversity_3,
                  title: 'Social Fabric',
                  description:
                      'The 7 clans define our kinship (Mari-Mata), dictating social interactions and communal harmony across Manipur.',
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // Why it Matters Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  decoration: const BoxDecoration(
                    border: Border(left: BorderSide(color: primary, width: 4)),
                  ),
                  child: const Text(
                    'Why it Matters',
                    style: TextStyle(
                      color: primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'serif',
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                _buildMatterItem(
                  icon: Icons.biotech, // Using biotech for genetics
                  title: 'Biological Integrity',
                  description:
                      'Science supports our traditional wisdom. Avoiding "same-blood" (Yek Akpiba) unions is essential to prevent genetic recessive disorders and ensure the biological health and vitality of future children.',
                ),
                const SizedBox(height: 24),
                _buildMatterItem(
                  icon: Icons.menu_book, // Using menu_book for auto_stories
                  title: 'Cultural Preservation',
                  description:
                      'Maintaining the distinction between clans preserves the sanctity of our customs. It prevents the dilution of our unique cultural identity and upholds the laws laid down by our forefathers.',
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // Contact Button & Footer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [primary, Color(0xFFB8860B)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        // Contact action here
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.contact_support, color: Colors.white),
                          SizedBox(width: 12),
                          Text(
                            'Contact Support',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 64,
                  height: 1,
                  color: primary.withOpacity(0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  '© 2026 YEK LOVE CHECKER • MEITEI HERITAGE FOUNDATION',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primary.withOpacity(0.4),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSacredCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: neutralDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primary.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primary, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: ivory.withOpacity(0.6),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatterItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: primary.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(color: primary.withOpacity(0.3)),
          ),
          child: Icon(icon, color: primary),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: const Color.fromARGB(255, 18, 22, 65),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  color: const Color.fromARGB(255, 18, 22, 65).withOpacity(0.6),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
