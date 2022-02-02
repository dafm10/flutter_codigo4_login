
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_login/ui/responsive/responsive.dart';
import 'package:flutter_codigo4_login/ui/widget/buttom_normal_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/input_field_normal_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/input_field_password_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/text_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ResponsiveUI responsive = ResponsiveUI(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              SizedBox(
                height: responsive.hp(10),
              ),
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Escudo_de_Trujillo_%28Perú%29.svg/1200px-Escudo_de_Trujillo_%28Perú%29.svg.png",
                height: responsive.hp(14),
              ),
              H1(
                text: "Trujillo Seguro",
              ),
              const SizedBox(
                height: 4.0,
              ),
              H6(text: "Municipalidad Provincial de Trujillo"),
              const SizedBox(
                height: 20.0,
              ),
              H2(
                text: "Registro",
              ),
              const SizedBox(
                height: 15.0,
              ),
              InputFieldNormalWidget(
                isNumeric: false,
                hintText: "Nombres",
              ),
              InputFieldNormalWidget(
                isNumeric: true,
                hintText: "DNI",
              ),
              InputFieldNormalWidget(
                isNumeric: true,
                hintText: "Teléfono",
              ),
              InputFieldNormalWidget(
                isNumeric: false,
                hintText: "Dirección",
              ),
              InputFieldPasswordWidget(),
              const SizedBox(
                height: 10.0,
              ),
              ButtomNormalWidget(
                text: "Iniciar Sesión",
                onPressed: () {},
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
