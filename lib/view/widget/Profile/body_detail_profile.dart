import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/view/widget/Profile/header_box_profile.dart';
import 'package:donasi_app/view/widget/Profile/text_field_style_profile.dart';
import 'package:flutter/material.dart';

class BodyDetailProfile extends StatefulWidget {
  const BodyDetailProfile({Key? key}) : super(key: key);

  @override
  State<BodyDetailProfile> createState() => _BodyDetailProfileState();
}

class _BodyDetailProfileState extends State<BodyDetailProfile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                children: const [
                   TextFieldStyleProfile(hintText: 'nama'),
                   TextFieldStyleProfile(hintText: 'alamat'),
                   TextFieldStyleProfile(hintText: 'tgl_lahir'),
                   TextFieldStyleProfile(hintText: 'nomor_hp'),
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
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/profile.png'),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
