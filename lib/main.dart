
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_login/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LoginApp",
      theme: ThemeData(
        textTheme:GoogleFonts.sourceSansProTextTheme().apply(),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
