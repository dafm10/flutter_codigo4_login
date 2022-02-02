import 'package:flutter/material.dart';
import 'package:flutter_codigo4_login/ui/general/colors.dart';
import 'package:flutter_codigo4_login/ui/responsive/responsive.dart';
import 'package:flutter_codigo4_login/ui/widget/text_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResponsiveUI responsive = ResponsiveUI(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("LoginApp"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Escudo_de_Trujillo_%28Perú%29.svg/1200px-Escudo_de_Trujillo_%28Perú%29.svg.png",
                height: responsive.hp(20),
              ),
              H1(
                text: "Trujillo Seguro",
              ),
              const SizedBox(
                height: 4.0,
              ),
              H6(text: "Municipalidad Provincial de Trujillo"),
              const SizedBox(
                height: 6.0,
              ),
              H2(
                text: "Iniciar Sesión",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
