import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/view/widget/Profile/body_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: BodyProfile(),
    );
  }
}
