import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'util.dart';


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
