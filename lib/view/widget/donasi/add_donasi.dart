import 'dart:io';

import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/core/repository/repository.dart';
import 'package:donasi_app/view/widget/home/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddDonasi extends StatefulWidget {
  const AddDonasi({Key? key}) : super(key: key);

  @override
  State<AddDonasi> createState() => _AddDonasiState();
}

class _AddDonasiState extends State<AddDonasi> {
  File? imageFile;
  int jumlahDonasi = 0;
  var logger = Logger();
  TextEditingController jumlahDonasiControll = TextEditingController();
  final Repository repoDonasi = Repository();

  @override
  void initState() {
    super.initState();
    jumlahDonasiControll = TextEditingController();
    NotificationWidget.init();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: jumlahDonasiControll,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Jumlah Donasi',
                      border: OutlineInputBorder(),
                      hintText: 'Jumlah Donasi',
                    ),
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
                        setState(() {
                          addDonasiSubmit(jumlahDonasi, context);
                          NotificationWidget.showNotification(
                              title: 'Notifikasi',
                              body: 'tolong segera konfirmasi struck anda sbelum hilang');
                        });
                      },
                      child: const Text(
                        'Donasi',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                // chek akun
              ],
            ),
          )
        ],
      ),
    );
  }

// add donasi submit
  Future<void> addDonasiSubmit(int jumlahDonasi,
      BuildContext ctx,) async {
    final prefs = await SharedPreferences.getInstance();
    var prefToken = prefs.getString('Token');
    var prefIdUser = prefs.getInt('Id');
    var prefIdProgram = prefs.getInt('IdProgram');

    String? token = prefToken;
    int? idUser = prefIdUser;
    int? idProgram = prefIdProgram!;

    String nilaiDonasi = jumlahDonasiControll.text;
    var nilaiParseToint = int.parse(nilaiDonasi);
    // int? nilaiDonasi = 5005;

    var response = await repoDonasi.addDonasiRepo(
      nilaiParseToint,
      idProgram,
      idUser,
      token!,
    );

    if (response.status == 200) {
      logger.d("Success donasi");
      try {
        logger.d(response.message);
        showDonasiDialog('Berhasil', 'Tolong segera tranfers terimakasih');
      } catch (e) {
        print(e);
      }
    } else {
      showDonasiDialog('Error', response.message);
    }
  }

  Future<void> showDonasiDialog(String title, message) {
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
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
