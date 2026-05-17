import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'util.dart';


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