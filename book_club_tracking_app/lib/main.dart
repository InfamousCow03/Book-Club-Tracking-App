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

class BookScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final String title;
  final String description;


  const BookScaffold({
    super.key,
    required this.body,
    required this.currentIndex,
    this.title = "book Talk",
    this.description = "stupid ahh book club",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,

          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lora(
                    color: AppColors.foreground,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
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
            currentIndex: currentIndex,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.mutedForeground,
            onTap: (index) {
              switch(index){
                case 0:
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MemberPage()));
                  break;
                case 1:
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LibraryPage()));
                  break;
                case 2:
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MeetingPage()));
                  break;
              }
            },
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
        ),

        body: body,
    );
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LibraryPage(),
    );
  }
}


class MeetingPage extends StatelessWidget {
  const MeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BookScaffold(
      currentIndex: 2,
      title: "Members",
      description: "stupid ahh members",
      body: const Center(
        child: Text("Members Page"),
      )
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BookScaffold(
      currentIndex: 1,
      body: const Center(
        child: Text("Library Page"),
      )
    );
  }
}

class MemberPage extends StatelessWidget {
  const MemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BookScaffold(
      currentIndex: 0,
      title: "Members",
      description: "stupid ahh members",
      body: const Center(
        child: Text("Meetings Page"),
      )
    );
  }
}