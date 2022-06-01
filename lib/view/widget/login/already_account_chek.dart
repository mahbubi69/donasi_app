import 'package:donasi_app/colors/colors.dart';
import 'package:flutter/material.dart';

class AllReadyAccountChek extends StatelessWidget {
  const AllReadyAccountChek({Key? key, this.login = true, required this.press})
      : super(key: key);

  final bool login;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? "Apakah Anda Tidak Memiliki Akun ? "
              : "Silahkan Daftar Terlebih Dahulu !",
          style: const TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Daftar Akun?" : " Masuk?",
            style: const TextStyle(color: amber, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
