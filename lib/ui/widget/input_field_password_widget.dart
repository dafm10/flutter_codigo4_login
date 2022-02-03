import 'package:flutter/material.dart';
import 'package:flutter_codigo4_login/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputFieldPasswordWidget extends StatefulWidget {

  TextEditingController? controller;

  InputFieldPasswordWidget({
    this.controller,
});

  @override
  _InputFieldPasswordWidgetState createState() =>
      _InputFieldPasswordWidgetState();
}

class _InputFieldPasswordWidgetState extends State<InputFieldPasswordWidget> {
  bool isInvisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black26.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 12.0),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isInvisible,
        decoration: InputDecoration(
          hintText: "Contraseña",
          hintStyle: TextStyle(
            color: COLOR_FONT_PRIMARY.withOpacity(0.4),
          ),
          prefixIcon: SvgPicture.asset(
            'assets/icons/bx-lock-alt.svg',
            color: COLOR_FONT_PRIMARY.withOpacity(0.4),
            height: 14,
            fit: BoxFit.scaleDown,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              isInvisible = !isInvisible;
              setState(() {

              });
            },
            icon: SvgPicture.asset("assets/icons/bx-show.svg",
            color: COLOR_FONT_PRIMARY.withOpacity(0.4),
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
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
        ),
        validator: (String? value){
          if(value!.isEmpty){
            return "El campo no puede estar vaciío";
          }
          return null;
        },
      ),
    );
  }
}
