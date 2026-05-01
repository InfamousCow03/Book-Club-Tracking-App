import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class AppColors {
  // Backgrounds
  static const background =Color(0xFF1B1410);
  static const card =Color(0xFF241B16);
  static const secondary =Color(0xFF2E2218);
  static const muted =Color(0xFF2A1F18);

  // Text / Foregrounds
  static const foreground =Color(0xFFF1E5CF);
  static const primaryForeground =Color(0xFF1B1410);
  static const secondaryFg =Color(0xFFE8DBC2);
  static const mutedForeground =Color(0xFF9A8773);
  static const accentForeground =Color(0xFFF1E5CF);

  // Accents / Actions
  static const primary =Color(0xFFD6A85F); // gold
  static const accent =Color(0xFFA45D3F);
  static const destructive =Color(0xFFC75A47);

  // Border
  static const border =Color(0xFF3A2C22);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.background,


        appBar: AppBar(
          backgroundColor: AppColors.background,

          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Book Talk",
                  style: GoogleFonts.lora(
                    color: AppColors.foreground,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "stupid ahh bookclub",
                  style: GoogleFonts.inter(
                    color: AppColors.mutedForeground,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          bottom: PreferredSize(preferredSize: const Size.fromHeight(12), child: Container(height: 1, color: AppColors.border,))
        ),




        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.border, width: 1)
            )
          ),
        
          child : BottomNavigationBar(
            
            backgroundColor: AppColors.background,
            currentIndex: 1,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.mutedForeground,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outlined),
                label: 'Members',
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                label: 'Library',
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                label: 'Meetings',
                ),
            ]
          ),
        )
      )
    );
  }
}