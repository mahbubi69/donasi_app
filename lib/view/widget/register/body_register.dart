import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../login/already_account_chek.dart';

class BodyRegister extends StatefulWidget {
  const BodyRegister({Key? key}) : super(key: key);

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  bool isObscure = true;
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
                  'Daftar Akun Baru',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: pink,
                      height: 1),
                ),
                Image.asset(
                  'assets/icons/bg_register.png',
                  height: size.height * 0.40,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                //input nama
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: kprimary, borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    // controller: emailControll,
                    // onChanged: onChanged,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person_outline,
                        color: pink,
                      ),
                      hintText: 'Nama',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //input email
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: kprimary, borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    // controller: emailControll,
                    // onChanged: onChanged,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: pink,
                      ),
                      hintText: 'Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //input password
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: kprimary, borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    obscureText: isObscure,
                    // controller: passwordControll,
                    // onChanged: onChanged,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: pink,
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
                        icon: const Icon(
                          Icons.lock_outlined,
                          color: pink,
                        ),
                        hintText: 'Password',
                        border: InputBorder.none),
                  ),
                ),
                //button
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      color: pink,
                      onPressed: () {
                        setState(() {
                          // showErrorDialog('error', 'cek anda');
                          // loginSubmit(email, password, context);
                        });
                      },
                      child: const Text(
                        'Daftar',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                // login user
                AllReadyAccountChek(
                    login: false,
                    press: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
