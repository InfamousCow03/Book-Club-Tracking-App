import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


Future<List<Map<String, dynamic>>> fetchBook(int status) async {
    final response = await Supabase.instance.client
        .from('Books')
        .select()
        .eq('status', status);
    return response;
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
