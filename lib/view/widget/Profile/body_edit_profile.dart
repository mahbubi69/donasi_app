import 'dart:async';
import 'package:donasi_app/core/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../colors/colors.dart';

class BodyEditProfile extends StatefulWidget {
  const BodyEditProfile({Key? key}) : super(key: key);

  @override
  State<BodyEditProfile> createState() => _BodyEditProfileState();
}

class _BodyEditProfileState extends State<BodyEditProfile> {
  String nama = '',
      alamat = '',
      tanggalLahir = '',
      noHp = '',
      id = '',
      token = '';

  TextEditingController namaControll = TextEditingController();
  TextEditingController alamatControll = TextEditingController();
  TextEditingController tglLahirControll = TextEditingController();
  TextEditingController nohpaControll = TextEditingController();
  var logger = Logger();

  Repository repository = Repository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namaControll = TextEditingController();
    alamatControll = TextEditingController();
    tglLahirControll = TextEditingController();
    nohpaControll = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: namaControll,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nama',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: alamatControll,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Alamat',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: tglLahirControll,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tgl Lahir',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: nohpaControll,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'No_Hp',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FlatButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                color: pink,
                onPressed: () {
                  setState(
                    () {
                      editProfileSubmit(
                          nama, alamat, tanggalLahir, noHp, id, token, context);
                    },
                  );
                },
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> editProfileSubmit(
    String nama,
    alamat,
    tglLahir,
    noHp,
    id,
    token,
    BuildContext context,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    var prefid = prefs.getInt('Id');
    var prefToken = prefs.getString('Token');

    String idUser = prefid.toString();
    String? tokenUser = prefToken;

    nama = namaControll.value.text;
    alamat = alamatControll.value.text;
    tglLahir = tglLahirControll.value.text;
    noHp = nohpaControll.value.text;
    id = idUser;
    token = tokenUser!;

    var response = await repository.editProfilerepo(
        nama, alamat, tglLahir, noHp, id, token);
    // logger.d(response.status);
    if (response.status == 200) {
      logger.d('berhasil register');
      try {
        // logger.d(response.message);
        // Timer(const Duration(seconds: 2), () => Navigator.pop(context));
        showErrorDialog('berhasil', response.message);
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
