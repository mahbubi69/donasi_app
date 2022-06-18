import 'package:donasi_app/core/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../colors/colors.dart';
import '../login/already_account_chek.dart';
import 'package:get/get.dart';

class BodyRegister extends StatefulWidget {
  const BodyRegister({Key? key}) : super(key: key);

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

enum SingingCharacter { L, P }

class _BodyRegisterState extends State<BodyRegister> {
  String nama = '',
      email = '',
      password = '',
      role = '',
      image = '',
      alamat = '',
      jenisKelamin = '',
      tanggalLahir = '',
      noHp = '';

  TextEditingController namaControll = TextEditingController();
  TextEditingController emailControll = TextEditingController();
  TextEditingController passwordControll = TextEditingController();
  TextEditingController alamatControll = TextEditingController();
  TextEditingController jenisKelaminControll = TextEditingController();
  TextEditingController tanggalLahirControll = TextEditingController();
  TextEditingController nomorHpControll = TextEditingController();

  final Repository repository = Repository();
  var logger = Logger();
  @override
  void initState() {
    super.initState();
    emailControll = TextEditingController();
    passwordControll = TextEditingController();
    alamatControll = TextEditingController();
    jenisKelaminControll = TextEditingController();
    tanggalLahirControll = TextEditingController();
    nomorHpControll = TextEditingController();
  }

  SingingCharacter _character = SingingCharacter.L;
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
                      color: amber,
                      height: 1),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                //input nama
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: primaryAmber,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: namaControll,
                    // onChanged: onChanged,
                    decoration: const InputDecoration(
                      hintText: 'Nama',
                      hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                //input email
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: primaryAmber,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: emailControll,
                    validator: (value) =>
                        GetUtils.isEmail(value!) ? null : 'Harus Email',
                    // onChanged: onChanged,
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle:
                            TextStyle(fontSize: 17.0, color: Colors.black),
                        border: InputBorder.none,
                        fillColor: amber),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                //input password
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: primaryAmber,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: passwordControll,
                    // onChanged: onChanged,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                //alamat
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: primaryAmber,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: alamatControll,
                    // onChanged: onChanged,
                    decoration: const InputDecoration(
                      hintText: 'Alamat',
                      hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: primaryAmber,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: jenisKelaminControll,
                    // onChanged: onChanged,
                    decoration: const InputDecoration(
                      hintText: 'Jenis Kelamin',
                      hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                //tanggal lahir
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: primaryAmber,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: tanggalLahirControll,
                    keyboardType: TextInputType.datetime,
                    // onChanged: onChanged,
                    decoration: const InputDecoration(
                      hintText: 'Tanggal Lahir',
                      hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                //nomor hp
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      color: primaryAmber,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: nomorHpControll,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'No Hp',
                      hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                //button
                Container(
                  width: size.width * 0.6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      color: amber,
                      onPressed: () {
                        setState(() {
                          registerSubmit(
                              nama,
                              email,
                              password,
                              role,
                              image,
                              alamat,
                              jenisKelamin,
                              tanggalLahir,
                              noHp,
                              context);
                        });
                      },
                      child: const Text(
                        'Daftar',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
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

  Future<void> registerSubmit(
    final String nama,
    email,
    password,
    role,
    image,
    alamat,
    jenisKelamin,
    tanggalLahir,
    noHp,
    BuildContext contex,
  ) async {
    String nama = namaControll.value.text;
    String email = emailControll.value.text;
    String password = passwordControll.value.text;
    String role = '2';
    String alamat = alamatControll.value.text;
    String jenisKelamin = jenisKelaminControll.value.text;
    String tanggalLahir = tanggalLahirControll.value.text;
    String nomorHp = nomorHpControll.value.text;

    var reponse = await repository.registerRepo(
      nama,
      email,
      password,
      role,
      image,
      alamat,
      jenisKelamin,
      tanggalLahir,
      nomorHp,
    );
    logger.d(reponse.status);
    if (reponse.status == 200) {
      showDialogRegister('Register', 'Berhasil Register');
    } else {
      showDialogRegister('Error', reponse.message);
    }
  }

  Future<void> showDialogRegister(String title, String message) {
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
