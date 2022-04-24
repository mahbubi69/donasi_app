// ignore_for_file: deprecated_member_use

import 'package:donasi_app/view/screen/detail_pofile_screen.dart';
import 'package:donasi_app/view/screen/setting_screen.dart';
import 'package:donasi_app/view/widget/Profile/img_profile_style.dart';
import 'package:donasi_app/view/widget/Profile/profile_menu_style.dart';
import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 90),
          const Center(
            child: ImagProfileStyle(),
          ),
          const SizedBox(height: 10),
          const Text(
            'Person User',
            style: TextStyle(fontSize: 20, color: pink),
          ),
          const SizedBox(height: 5),
          const Text('muhammadmahbubi495@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          const SizedBox(height: 45),
          ProfileMenuStyle(
            text: 'My Account',
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailProfileScreen()));
            },
            icon: 'assets/svg/ic_user.svg',
          ),
          ProfileMenuStyle(
              text: 'Seetings',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()));
              },
              icon: 'assets/svg/ic_setting.svg'),
          // ProfileMenuStyle(
          //   text: 'About',
          //   press: () {
          //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //       content: Text('version Applications 1.0.0',
          //           style: TextStyle(fontSize: 15)),
          //       backgroundColor: pink,
          //     ));
          //   },
          //   icon: 'assets/svg/ic_about.svg',
          // ),
          ProfileMenuStyle(
            text: 'Log Out',
            press: () {},
            icon: 'assets/svg/ic_logout.svg',
          ),
        ],
      ),
    );
  }
}
