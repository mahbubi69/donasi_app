import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/view/widget/setting/body_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: amber,
        title: const Text('Setting'),
      ),
      body: const BodySetting(),
    );
  }
}
