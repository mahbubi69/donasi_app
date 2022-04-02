import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/view/screen/register_screen.dart';
import 'package:donasi_app/view/widget/login/already_account_chek.dart';
import 'package:donasi_app/view/widget/login/button_style1.dart';
import 'package:donasi_app/view/widget/login/input_email.dart';
import 'package:donasi_app/view/widget/login/input_password.dart';
import 'package:donasi_app/view/widget/navigation/navigation_bar_style.dart';
import 'package:flutter/material.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key}) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
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
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: pink,
                    height: 1),
              ),
              Image.asset(
                'assets/icons/bg_login.png',
                height: size.height * 0.40,
              ),
              SizedBox(
                height: size.height * 0.01,
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
                          builder: (context) => const NavigationBarStyle()));
                },
                text: 'Masuk',
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              AllReadyAccountChek(press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
              })
            ],
          ))
        ],
      ),
    );
  }
}
