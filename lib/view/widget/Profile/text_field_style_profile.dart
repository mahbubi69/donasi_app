import 'package:donasi_app/colors/colors.dart';
import 'package:flutter/material.dart';

class ButtonFieldStyleProfile extends StatelessWidget {
  ButtonFieldStyleProfile({
    Key? key,
    required this.hintText,
    required this.press,
  }) : super(key: key);

  final String hintText;
  VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
              primary: primaryAmber,
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: amber),
          onPressed: press,
          child: Center(
            child: Text(
              hintText,
              style: const TextStyle(color: kTextColor, fontSize: 17),
            ),
          ),
        ));

    // Material(
    //   elevation: 4,
    //   shadowColor: amber,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: TextField(
    //     decoration: InputDecoration(
    //         hintText: hintText,
    //         hintStyle: const TextStyle(
    //           letterSpacing: 2,
    //           color: Colors.white,
    //           fontWeight: FontWeight.bold,
    //         ),
    //         fillColor: amber,
    //         filled: true,
    //         border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(10.0),
    //             borderSide: BorderSide.none)),
    //   ),
    // );
  }
}
