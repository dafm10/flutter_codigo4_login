
import 'package:flutter/material.dart';

class ButtomNormalWidget extends StatelessWidget {

  String text;
  Function onPressed;

  ButtomNormalWidget({
    required this.text,
    required this.onPressed,
});

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
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
