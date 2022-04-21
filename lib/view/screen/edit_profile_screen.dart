import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/view/widget/Profile/body_edit_profile.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: pink,
        title: Text('Edit Profile'),
      ),
      body: BodyEditProfile(),
    );
  }
}
