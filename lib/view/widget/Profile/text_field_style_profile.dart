import 'package:donasi_app/colors/colors.dart';
import 'package:flutter/material.dart';

class TextFieldStyleProfile extends StatelessWidget {
  const TextFieldStyleProfile({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: kprimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: pink,
              fontWeight: FontWeight.bold,
            ),
            fillColor: kprimary,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
    ;
  }
}
