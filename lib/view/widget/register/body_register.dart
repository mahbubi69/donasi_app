import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/view/screen/home_screen.dart';
import 'package:donasi_app/view/screen/login_screen.dart';
import 'package:donasi_app/view/widget/login/already_account_chek.dart';
import 'package:donasi_app/view/widget/login/button_style1.dart';
import 'package:donasi_app/view/widget/login/input_email.dart';
import 'package:donasi_app/view/widget/login/input_password.dart';
import 'package:flutter/material.dart';

class BodyRegister extends StatefulWidget {
  const BodyRegister({Key? key}) : super(key: key);

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: pink,
                  height: 1,
                ),
              ),
              Image.asset(
                'assets/icons/bg_register.png',
                height: size.height * 0.40,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              InputUsername(
                hintText: 'Nama',
                onChanged: (value) {},
                inputType: TextInputType.emailAddress,
                icon: Icons.person_outline,
              ),
              InputUsername(
                  hintText: 'Email',
                  onChanged: (value) {},
                  inputType: TextInputType.emailAddress,
                  icon: Icons.email_outlined),
              InputPassword(
                hintText: 'Password',
                icon: Icons.lock_outline,
                onChanged: (value) {},
                iconHd: _isObscure ? Icons.visibility : Icons.visibility_off,
                btnIconHd: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                isObscure: _isObscure,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ButtonStyle1(
                size: size,
                color: pink,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                text: 'Register',
              ),
              AllReadyAccountChek(
                  login: false,
                  press: () {
                    Navigator.pop(context);
                  })
            ],
          ))
        ],
      ),
    );
  }
}
