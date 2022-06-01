import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/view/widget/Profile/header_box_profile.dart';
import 'package:donasi_app/view/widget/Profile/text_field_style_profile.dart';
import 'package:flutter/material.dart';

class DetailProfile extends StatelessWidget {
  final String nama, alamat, tglLahir, noHp;
  ImageProvider image;
  VoidCallback onpres;
  DetailProfile({
    Key? key,
    required this.nama,
    required this.alamat,
    required this.tglLahir,
    required this.noHp,
    required this.image,
    required this.onpres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: amber,
        actions: <Widget>[
          Container(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                child: const Text(
                  'Ubah',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: onpres,
              )),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonFieldStyleProfile(
                      hintText: nama,
                      press: () {},
                    ),
                    ButtonFieldStyleProfile(
                      hintText: alamat,
                      press: () {},
                    ),
                    ButtonFieldStyleProfile(
                      hintText: tglLahir,
                      press: () {},
                    ),
                    ButtonFieldStyleProfile(
                      hintText: noHp,
                      press: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderBoxProfile(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 35, letterSpacing: 1.5, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 200,
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: image,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
