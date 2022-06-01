import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/view/widget/donasi/add_donasi.dart';
import 'package:flutter/material.dart';

class AddDonasiScren extends StatefulWidget {
  const AddDonasiScren({Key? key}) : super(key: key);

  @override
  State<AddDonasiScren> createState() => _AddDonasiScrenState();
}

class _AddDonasiScrenState extends State<AddDonasiScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: amber,
        title: const Text('Donasi'),
      ),
      body: const AddDonasi(),
    );
  }
}
