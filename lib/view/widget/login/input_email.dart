import 'package:donasi_app/colors/colors.dart';
import 'package:flutter/material.dart';

class InputUsername extends StatelessWidget {
  const InputUsername(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.inputType,
      required this.onChanged})
      : super(key: key);

  final TextInputType inputType;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: pink,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kprimary, borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}
