
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo4_login/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputFieldNormalWidget extends StatelessWidget {
  const InputFieldNormalWidget({Key? key}) : super(key: key);

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
            'assets/icons/bx-id.svg',
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
      ),
    );
  }
}