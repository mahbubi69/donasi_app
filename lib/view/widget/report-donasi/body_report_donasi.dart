import 'package:donasi_app/view/widget/home/header_box.dart';
import 'package:donasi_app/view/widget/report-donasi/header_top.dart';
import 'package:donasi_app/view/widget/report-donasi/list_item_report_donasi.dart';
import 'package:flutter/material.dart';

class BodyReportDonasi extends StatefulWidget {
  const BodyReportDonasi({Key? key}) : super(key: key);

  @override
  State<BodyReportDonasi> createState() => _BodyReportDonasiState();
}

class _BodyReportDonasiState extends State<BodyReportDonasi> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // ListItemProgram()
        HeaderTop(size: size),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                // childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => const ListItemReportDonasi()),
        ),
      ],
    );
  }
}
