import 'package:flutter/material.dart';
import 'package:flutter_codigo4_login/helpers/sp_global.dart';
import 'package:flutter_codigo4_login/helpers/utils.dart';
import 'package:flutter_codigo4_login/pages/login_page.dart';
import 'package:flutter_codigo4_login/services/api_service.dart';
import 'package:flutter_codigo4_login/ui/widget/buttom_normal_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/input_field_normal_widget.dart';
import 'package:flutter_codigo4_login/ui/widget/input_field_password_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  APIService _apiService = APIService();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _dniController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SPGlobal prefs = SPGlobal();
  bool isLoading = true;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiService.getUser().then((value) {
      if (value != null) {
        _nameController.text = value.nombreCompleto.toString();
        _dniController.text = value.dni.toString();
        _phoneController.text = value.telefono.toString();
        _addressController.text = value.direccion.toString();
        //_passwordController.text = value.password.toString();
        isLoading = false;
        setState(() {});
      }
    });
  }

  _updateUser(){
    if(_keyForm.currentState!.validate()){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datos de Contacto"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _updateUser();
        },
        child: Icon(Icons.save),
      ),
      body: !isLoading
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _keyForm,
                  child: Column(
                    children: [
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
                      SizedBox(
                        height: 20.0,
                      ),
                      ButtomNormalWidget(
                        text: "Cerrar Sesión",
                        color: Colors.redAccent,
                        onPressed: () {
                          prefs.token = "";
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
