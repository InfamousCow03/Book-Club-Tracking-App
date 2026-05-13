import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://iuxahzvrlatmmlaxafxy.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1eGFoenZybGF0bW1sYXhhZnh5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzgwMDM0MTAsImV4cCI6MjA5MzU3OTQxMH0.D4R32yo-OsZtTMPH4tIgcitUHrr5mFb94cGsiJwXeKs',
  );

  runApp(const MyApp());
}

class AppColors {
  // Backgrounds
  static const background =Color(0xFF1B1410);
  static const card =Color(0xFF241B16);
  static const secondary =Color(0xFF2E2218);
  static const muted =Color.fromARGB(255, 48, 36, 28);
  static const book = Color(0xFF405C4E);
  static const bookspine = Color.fromARGB(255, 53, 77, 64);

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
    this.title = "Book Talk",
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
      title: "Meetings",
      description: "stupid ahh meetings",
      body: const Center(
        child: Text("Members Page"),
      )
    );
  }
}

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int selectedTab = 0;

  Future<Map<String, dynamic>> fetchBook() async {
    final response = await Supabase.instance.client
        .from('Books')
        .select()
        .eq('id', 1).single();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return BookScaffold(
      currentIndex: 1,
      body: Padding(
        padding: const EdgeInsets.fromLTRB( 12, 6, 12, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //currently reading container
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.muted,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => selectedTab = 0),
                    child: Container(
                      height: 30,
                      width: 125,
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Reading',
                        style: GoogleFonts.lora(
                          color: AppColors.mutedForeground,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )
                      )

                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => selectedTab = 1),
                    child: Container(
                      height: 30,
                      width: 125,
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Read',
                        style: GoogleFonts.lora(
                          color: AppColors.mutedForeground,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )
                      )

                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => selectedTab = 2),
                    child: Container(
                      height: 30,
                      width: 125,
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Want To Read',
                        style: GoogleFonts.inter(
                          color: AppColors.mutedForeground,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )
                      )

                    ),
                  ),
                  
                ],
              )
            ),

            //book info container
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB( 3, 6, 3, 6),
              decoration: BoxDecoration(
                color: AppColors.muted,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.border),
              ),


              child : FutureBuilder(
                future: fetchBook(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return Row(
                      children: [
                        const SizedBox(width: 12),
                        Container(
                          height: 150,
                          width: 10,
                          decoration: BoxDecoration(
                            color: AppColors.book,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(2), bottomLeft: Radius.circular(2)),
                            border : Border(right: BorderSide(color: AppColors.bookspine, width: 2)),
                            //border: Border.all(color: AppColors.border),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 90,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.book,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                            //border: Border.all(color: AppColors.border),
                          ),

                          child: Column(
                            children:[
                              Text(
                                snapshot.data!['title'],
                                style: GoogleFonts.lora(
                                  color: AppColors.foreground,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                              Text(
                                snapshot.data!['author'],
                                style: GoogleFonts.lora(
                                  color: AppColors.foreground,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            ]
                          )
                        ),

                        const SizedBox(width: 12),
                        Container(
                          height: 175,
                          width: 255,
                          padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                          decoration: BoxDecoration(
                            color: AppColors.muted,
                            borderRadius: BorderRadius.all(Radius.circular(6))
                            
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  snapshot.data!['title'],
                                  style: GoogleFonts.lora(
                                    color: AppColors.foreground,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child : Text(
                                  snapshot.data!['author'],
                                  style: GoogleFonts.inter(
                                    color: AppColors.mutedForeground,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 1),
                                child: Text(
                                  '----------------------------------',
                                  style: GoogleFonts.inter(
                                    color: AppColors.mutedForeground,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 1),
                                child: Text(
                                  'Page 0 of ${snapshot.data!['pages']}                                0%',
                                  style: GoogleFonts.inter(
                                    color: AppColors.mutedForeground,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                              ),
                            ]
                          )
                        )
                      ],
                    );
                  }
                  if(snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return const CircularProgressIndicator();
                }
              )
            ),
          ],
        ),
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