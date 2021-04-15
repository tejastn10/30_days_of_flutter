import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.deepPurple),
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.deepPurple)),
      );

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);

  // Colors
  static Color cream = Color(0xfff5f5f5);
  static Color darkBlue = Color(0xff403b58);
}
