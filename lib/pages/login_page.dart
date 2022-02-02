import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo4_login/ui/general/colors.dart';
import 'package:flutter_codigo4_login/ui/responsive/responsive.dart';
import 'package:flutter_codigo4_login/ui/widget/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.05),
                      offset: Offset(0, 5),
                      blurRadius: 12.0,
                    ),
                  ],
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    hintText: "DNI",
                    hintStyle: TextStyle(
                      color: COLOR_FONT_PRIMARY.withOpacity(0.4),
                    ),
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/bx-id.svg",
                      color: COLOR_FONT_PRIMARY.withOpacity(0.4),
                      height: 14,
                      fit: BoxFit.scaleDown,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
