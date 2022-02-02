
import 'package:flutter/material.dart';

class ButtomNormalWidget extends StatelessWidget {
  const ButtomNormalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
            side: BorderSide.none,
          ),
        ),
        onPressed: () {},
        child: Text(
          "Iniciar Sesión",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
