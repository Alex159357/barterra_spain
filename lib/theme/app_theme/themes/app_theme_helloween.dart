

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeHalloween{
  final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xffDED5F7),
      titleTextStyle: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff212121), letterSpacing: 0.5),
    ),
    hoverColor: Color(0xFFBDABF0),
    primaryColor: const Color(0xff131628),
    //tab_bar
    tabBarTheme: TabBarTheme(
      labelColor: const Color(0xFF5C2FDA),
      unselectedLabelColor: const Color(0xFF8288A3),
      labelPadding: const EdgeInsets.only(left: 5, right: 5,),
      labelStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
      unselectedLabelStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
      // indicator: BoxDecoration(
      //     borderRadius: BorderRadius.circular(50), // Creates border
      //     color: Color(0xFF5C2FDA)),
      // indicatorSize: TabBarIndicatorSize.label,
    ),

    primaryColorLight: const Color(0x218167e6),
    primaryColorDark: const Color(0xff371C82),
    scaffoldBackgroundColor: const Color(0xff333333),
    backgroundColor: const Color(0xff212121),
    bottomAppBarColor: const Color(0xffeae9ef),
    cardColor: const Color(0xffffffff),
    dividerColor: const Color(0xffC0C3D1),
    focusColor: const Color(0x1a311F06),
    errorColor: const Color(0xFFE60012),
    cardTheme: CardTheme(
      color: const Color(0xFFDED5F7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: const Color(0xff8167e6)),
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: GoogleFonts.inter(fontSize: 18, color: Color(0xff212121), letterSpacing: 0.5),
      contentTextStyle:  GoogleFonts.inter(fontSize: 12, color: Color(0xff212121), letterSpacing: 0.5),
      backgroundColor: const Color(0xffffffff),
    ),
    textTheme: TextTheme(
      subtitle1: GoogleFonts.roboto(color: const Color(0xFF241257), fontSize: 10),
      headline5: GoogleFonts.roboto(color: const Color(0xFF8288A3), fontSize: 12),
      bodyText1: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF596084,),),
      headline1: GoogleFonts.inter(fontSize: 36, fontWeight: FontWeight.w900, color: const Color(0xFF571CFF,),),
      labelMedium: GoogleFonts.inter(fontSize: 18, color: Color(0xff212121), letterSpacing: 0.5),
      titleSmall:GoogleFonts.inter(fontSize: 14, color: Color(0xff757575), letterSpacing: 0.5),
      caption: GoogleFonts.inter(fontSize: 16, color: Colors.white, letterSpacing: 0.5),
      bodyMedium: GoogleFonts.inter(
          fontSize: 24,
          color: const Color(0xFF212121),
          fontWeight: FontWeight.w600),
      titleLarge: GoogleFonts.inter(
          fontSize: 20,
          color: const Color(0xFF131628),
          fontWeight: FontWeight.w600),
      headlineMedium: GoogleFonts.inter(
          fontSize: 16,
          color: const Color(0xFF007AFC),
          fontWeight: FontWeight.w600),
    ),
    // iconTheme: const IconThemeData(
    //     color: Colors.black38
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: const Color(0xFF131628),
        primary: Colors.blue,
      ),
    ),

    listTileTheme: const ListTileThemeData(
        iconColor: Color(0xFFEAE9EF)
    ),
    secondaryHeaderColor: const Color(0xFF64C0AB),
    unselectedWidgetColor: Color(0xFFFDD000),
    // colorSchemeSeed: MaterialColor([]),
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: const MaterialColor(0xff571CFF,
          <int, Color>{
            200: Color(0xffDDD1FF),
            300: Color(0xffBBA4FF),
            400: Color(0xff8960FF),
            500: Color(0xff571CFF),
            700: Color(0xff4516CC),
            800: Color(0xff341099),
            900: Color(0xff220B66)
          },
        )).copyWith(
      secondary: const MaterialColor(0xffFF571C, <int, Color>{
        200: Color(0xffFFDDD1),
        300: Color(0xffFFBBA4),
        400: Color(0xffFF8960),
        500: Color(0xffFF571C),
        700: Color(0xffCC4516),
        800: Color(0xff993410),
        900: Color(0xff4C1A08)
      }),
      background: const Color(0xffDDD1FF ),
    ),
    selectedRowColor: Color(0xFF8C6DE5),
    dividerTheme: const DividerThemeData(
        endIndent: 20,
        indent: 20,
        color: Color(0xffBBA4FF)
    ),
    useMaterial3: true,
    hintColor: const Color(0xFFACAFC1),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(const Color(0xFF212121)),
      overlayColor: MaterialStateProperty.all(const Color(0x33212121)),
      side: MaterialStateBorderSide.resolveWith(
            (states) {
          return const BorderSide(width: 1.0, color: Color(0xFF212121));
        },
      ),
    ),
    disabledColor: const Color(0xff616161),
    buttonTheme: const ButtonThemeData(buttonColor: Color(0xFFF5F5F5)),
    highlightColor: Colors.grey.shade200,
  );
}