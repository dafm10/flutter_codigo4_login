
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo4_login/helpers/utils.dart';
import 'package:flutter_codigo4_login/models/user_model.dart';
import 'package:flutter_codigo4_login/pages/home_page.dart';
import 'package:flutter_codigo4_login/pages/register_page.dart';
import 'package:flutter_codigo4_login/services/api_service.dart';
import 'package:flutter_codigo4_login/ui/general/colors.dart';
import 'package:flutter_codigo4_login/ui/responsive/responsive.dart';
import 'package:flutter_codigo4_login/ui/widget/buttom_normal_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/input_field_normal_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/input_field_password_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _dniController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  APIService apiService = APIService();

  _login() {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {

      });

      User _user = User(
        username: _dniController.text,
        password: _passwordController.text,
      );
      apiService.login(_user).then((value) {
        isLoading = false;
        setState(() {

        });
        if (value != null) {
          //pushAndRemoveUntil hace que la pagina login se elimine y vaya a la siguiente página
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false);
          //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
        } else {
          isLoading = false;
          setState(() {

          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: COLOR_FONT_PRIMARY,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 3),
              content: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/error.svg",
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                        "Hubo un inconveniente. Por favor intenta nuevamente"),
                  ),
                ],
              ),
            ),
          );
        }
      }).catchError((error) {
        isLoading = false;
        setState(() {

        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: COLOR_FONT_PRIMARY,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
            content: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/cloud.svg",
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Text(
                      "Hubo un error. Revisa tu conexión a internet e inténtalo nuevamente"),
                ),
              ],
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveUI responsive = ResponsiveUI(context);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                    /*Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Escudo_de_Trujillo_%28Perú%29.svg/1200px-Escudo_de_Trujillo_%28Perú%29.svg.png",
                      height: responsive.hp(20),
                    ),*/
                    Image.asset(
                      "assets/images/trujillo-escudo.jpg",
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
                    H3(
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
                      controller: _dniController,
                    ),
                    InputFieldPasswordWidget(
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ButtomNormalWidget(
                      text: "Iniciar Sesión",
                      onPressed: () {
                        _login();
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
          isLoading ? Container(
            color: Colors.white60,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
