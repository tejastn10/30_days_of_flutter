import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        cardColor: Colors.white,
        canvasColor: lightbg,
        buttonColor: darkcl,
        accentColor: darkcl,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.deepPurple),
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.deepPurple)),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkbg,
        buttonColor: lightcl,
        accentColor: lightcl,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.deepPurple)),
      );

  // Colors
  static Color lightbg = Color(0xfff5f5f5);
  static Color darkbg = Color(0xff1b1b3b);
  static Color darkcl = Color(0xff403b58);
  static Color lightcl = Color(0xff9575cd);
}
