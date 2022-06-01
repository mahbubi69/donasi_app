import 'package:donasi_app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:donasi_app/view/widget/donasi/body_report_donasi.dart';

class NotivocationsScreen extends StatefulWidget {
  const NotivocationsScreen({Key? key}) : super(key: key);

  @override
  State<NotivocationsScreen> createState() => _NotivocationsScreenState();
}

class _NotivocationsScreenState extends State<NotivocationsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BodyReportDonasi());
  }
}
