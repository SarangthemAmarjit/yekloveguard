  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:yekloveguard/controller.dart/yek_controller.dart';

Widget clanCard({
    required String name,
    required int index,
    required String subtitle,
    required String description,
    required IconData icon,
    required YekController ykcon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 44, 78).withOpacity(0.3),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ykcon
                .getYEKcolor(yekname: ykcon.allyekdata[index]!.yekname)
                .withOpacity(0.2),
            Colors.transparent,
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ykcon.setselectedyekindex(ind: index);
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
                      StrokeText(
                        text: name,
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: ykcon.getYEKcolor(
                            yekname: ykcon.allyekdata[index]!.yekname,
                          ),
                          letterSpacing: 1.7,
                        ),
                        strokeColor: const Color.fromARGB(255, 2, 8, 124),
                        strokeWidth: 1.5,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: const Color.fromARGB(255, 0, 44, 78),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Colors.grey[700],
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Card(
                  elevation: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      ykcon.getYEKimage(
                        yekname: ykcon.allyekdata[index]!.yekname,
                      ),

                      height: 150,
                    ),
                  ),
                ),
                // Icon(icon, size: 40, color: primaryGold.withOpacity(0.8)),
              ],
            ),
          ),
        ),
      ),
    );
  }