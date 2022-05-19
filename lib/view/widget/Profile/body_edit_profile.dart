import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class BodyEditProfile extends StatefulWidget {
  const BodyEditProfile({Key? key}) : super(key: key);

  @override
  State<BodyEditProfile> createState() => _BodyEditProfileState();
}

class _BodyEditProfileState extends State<BodyEditProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              // controller: controllerName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nama',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              // controller: controllerName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Alamat',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              // controller: controllerName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tgl Lahir',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              // controller: controllerName,
              decoration: InputDecoration(
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
                      // showErrorDialog('error', 'cek anda');
                      // loginSubmit(email, password, context);
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
}
