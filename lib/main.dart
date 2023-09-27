import 'package:flutter/material.dart';
import 'package:mobile_certification_app/home/home_view.dart';
import 'package:mobile_certification_app/login/login_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_certification_app/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xffEEEEEE),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff041562),
          onPrimary: Color(0xff041562),
          secondary: Color(0xff11468F),
          onSecondary: Color(0xff11468F),
          error: Color(0xffDA1212),
          onError: Color(0xffDA1212),
          background: Color(0xffEEEEEE),
          onBackground: Color(0xffEEEEEE),
          surface: Color(0xffEEEEEE),
          onSurface: Color(0xffEEEEEE),
        ),
      ),
    );
  }
}
