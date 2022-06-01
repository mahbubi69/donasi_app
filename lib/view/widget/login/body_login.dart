// ignore_for_file: deprecated_member_use
import 'package:donasi_app/core/repository/repository.dart';
import 'package:donasi_app/view/widget/login/already_account_chek.dart';
import 'package:donasi_app/view/widget/navigation/navigation_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../../colors/colors.dart';
import '../../../core/utils/value.dart';
import '../../screen/register_screen.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key}) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  String email = '', password = '';
  var logger = Logger();
  TextEditingController emailControll = TextEditingController();
  TextEditingController passwordControll = TextEditingController();
  final Repository repoUser = Repository();
  bool isObscure = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailControll = TextEditingController();
    passwordControll = TextEditingController();
  }

  GlobalKey<FormState> fromKey = GlobalKey();
  bool shouldPop = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SingleChildScrollView(
                child: Form(
              key: fromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: amber,
                        height: 1),
                  ),
                  Image.asset(
                    'assets/icons/bg_login.png',
                    height: size.height * 0.40,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  //input email
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        color: primaryAmber,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: emailControll,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'masukkan emailmu';
                        }
                        return null;
                      },
                      onSaved: (value) => email = value!,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: amber,
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
                        color: primaryAmber,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      obscureText: isObscure,
                      controller: passwordControll,
                      validator: (value) => value == null || value.isEmpty
                          ? "Masukkan passwordmu"
                          : null,
                      onSaved: (value) => password = value!,
                      // onChanged: onChanged,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: amber,
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                          icon: const Icon(
                            Icons.lock_outlined,
                            color: amber,
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
                        color: amber,
                        onPressed: () {
                          fromKey.currentState!.validate();
                          setState(() {
                            loginSubmit(email, password, context);
                          });
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  // chek akun
                  AllReadyAccountChek(
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Future<void> loginSubmit(
    String email,
    password,
    BuildContext context,
  ) async {
    String email = emailControll.value.text;
    String password = passwordControll.value.text;
    var response = await repoUser.loginRepo(
      email,
      password,
    );
    logger.d(response.status);

    if (response.status == 200) {
      logger.d("Success Login");
      try {
        logger.d(response.token.toString());
        prefSetToken(response.token!);
        prefSetId(response.data!.id);

        print('token = ' + response.token!);
        print('idUser = ' + response.data!.id.toString());

        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NavigationBarStyle(),
          ),
        );
      } catch (e) {
        print(e);
      }
    } else {
      showErrorDialog('Error', response.message);
    }
  }

  Future<void> showErrorDialog(String title, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
