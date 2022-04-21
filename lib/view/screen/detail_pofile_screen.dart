import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/view/screen/edit_profile_screen.dart';
import 'package:donasi_app/view/widget/Profile/body_detail_profile.dart';
import 'package:flutter/material.dart';

class DetailProfileScreen extends StatefulWidget {
  const DetailProfileScreen({Key? key}) : super(key: key);

  @override
  State<DetailProfileScreen> createState() => _DetailProfileScreenState();
}

class _DetailProfileScreenState extends State<DetailProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: pink, actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.edit_calendar_outlined),
          tooltip: 'Show Snackbar',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditProfileScreen()));
          },
        ),
      ]),
      body: const BodyDetailProfile(),
    );
  }
}
