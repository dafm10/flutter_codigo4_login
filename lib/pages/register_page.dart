import 'package:flutter/material.dart';
import 'package:flutter_codigo4_login/helpers/utils.dart';
import 'package:flutter_codigo4_login/models/user_model.dart';
import 'package:flutter_codigo4_login/pages/home_page.dart';
import 'package:flutter_codigo4_login/services/api_service.dart';
import 'package:flutter_codigo4_login/ui/responsive/responsive.dart';
import 'package:flutter_codigo4_login/ui/widget/buttom_normal_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/general_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/input_field_normal_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/input_field_password_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/text_widget.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  APIService _apiService = APIService();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _dniController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  void _register() {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});

      User _user = User(
        nombreCompleto: _nameController.text,
        dni: _dniController.text,
        telefono: _phoneController.text,
        direccion: _addressController.text,
        password: _passwordController.text,
      );
      _apiService.register(_user).then((value) {
        isLoading = false;
        setState(() {});
        if (value != null) {
          if (value.id != null) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
                (route) => false);
          } else {
            if (value.dni!.isNotEmpty) {
              showSnackErrorMessage(
                context,
                "error",
                "El DNI ya existe. Por favor ingresa otro DNI.",
              );
            } else if (value.telefono!.isNotEmpty) {
              showSnackErrorMessage(
                context,
                "error",
                "El teléfono ya existe. Por favor ingresa otro teléfono",
              );
            }
          }
          isLoading = false;
          setState(() {});
        }
      }).catchError((error) {
        isLoading = false;
        setState(() {});
        showSnackErrorMessage(
          context,
          "cloud",
          "Hubo un error. Revisa tu conexión a internet e inténtalo nuevamente.",
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
              padding: const EdgeInsets.all(14.0),
              child: Form(
                key: _formKey,
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
                      icon: 'bx-user',
                      controller: _nameController,
                    ),
                    InputFieldNormalWidget(
                      isNumeric: true,
                      hintText: "DNI",
                      icon: 'bx-id',
                      typeInput: TypeInputTextField.dni,
                      controller: _dniController,
                    ),
                    InputFieldNormalWidget(
                      isNumeric: true,
                      hintText: "Teléfono",
                      icon: 'bx-phone',
                      typeInput: TypeInputTextField.phone,
                      controller: _phoneController,
                    ),
                    InputFieldNormalWidget(
                      isNumeric: false,
                      hintText: "Dirección",
                      icon: 'bx-map',
                      controller: _addressController,
                    ),
                    InputFieldPasswordWidget(
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ButtomNormalWidget(
                      text: "Registrar",
                      onPressed: () {
                        _register();
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          isLoading
              ? Container(
                  color: Colors.white60,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
