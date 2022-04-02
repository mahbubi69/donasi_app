import 'package:donasi_app/colors/colors.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  const InputPassword(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.iconHd,
      required this.btnIconHd,
      required this.onChanged,
      required this.isObscure})
      : super(key: key);

  final String hintText;
  final IconData icon, iconHd;
  final bool isObscure;
  final VoidCallback btnIconHd;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isObscure,
        onChanged: onChanged,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: Icon(
                  iconHd,
                  color: pink,
                ),
                onPressed: btnIconHd),
            icon: Icon(
              icon,
              color:  pink,
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
