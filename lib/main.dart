
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_login/helpers/sp_global.dart';
import 'package:flutter_codigo4_login/pages/home_page.dart';
import 'package:flutter_codigo4_login/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SPGlobal prefs = SPGlobal();
  await prefs.initShared();
  runApp(MyApp());
}

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
      home: PreInit(),
    );
  }
}


class PreInit extends StatelessWidget {

  SPGlobal prefs = SPGlobal();

  @override
  Widget build(BuildContext context) {
    return prefs.token.length >0 ? HomePage() : LoginPage();
  }
}
