import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo4_login/helpers/utils.dart';
import 'package:flutter_codigo4_login/pages/register_page.dart';
import 'package:flutter_codigo4_login/services/api_service.dart';
import 'package:flutter_codigo4_login/ui/general/colors.dart';
import 'package:flutter_codigo4_login/ui/responsive/responsive.dart';
import 'package:flutter_codigo4_login/ui/widget/buttom_normal_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/input_field_normal_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/input_field_password_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    final ResponsiveUI responsive = ResponsiveUI(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: responsive.hp(10),
                ),
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
                  height: 20.0,
                ),
                H2(
                  text: "Iniciar Sesión",
                ),
                const SizedBox(
                  height: 15.0,
                ),
                InputFieldNormalWidget(
                  isNumeric: true,
                  hintText: "DNI",
                  icon: 'bx-id',
                  typeInput: TypeInputTextField.dni,
                ),
                InputFieldPasswordWidget(),
                const SizedBox(
                  height: 10.0,
                ),
                ButtomNormalWidget(
                  text: "Iniciar Sesión",
                  onPressed: () {
                    apiService.login();
                    if(_formKey.currentState!.validate()){
                      apiService.login();
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    H6(text: "¿No estás registrado?, "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => RegisterPage()),
                          ),
                        );
                      },
                      child: H6Bold(
                        text: "Regístrate",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
