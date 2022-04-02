// ignore_for_file: deprecated_member_use

import 'package:donasi_app/view/widget/Profile/img_profile_style.dart';
import 'package:donasi_app/view/widget/Profile/profile_menu_style.dart';
import 'package:flutter/material.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Center(
            child: ImagProfileStyle(),
          ),
          const SizedBox(height: 45),
          ProfileMenuStyle(
            text: 'My Account',
            press: () {},
            icon: 'assets/svg/ic_user.svg',
          ),
          ProfileMenuStyle(
              text: 'Seetings',
              press: () {},
              icon: 'assets/svg/ic_setting.svg'),
          ProfileMenuStyle(
            text: 'About',
            press: () {}, 
            icon: 'assets/svg/ic_about.svg',
          ),
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
