import 'package:donasi_app/view/widget/home/detail_list_item_program.dart';
import 'package:donasi_app/view/widget/home/header_box.dart';
import 'package:donasi_app/view/widget/home/list_item_program.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeaderBox(
          size: size,
        ),
        // ListItemProgram()
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ListItemProgram(press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailListItemProgram()),
              );
            }),
          ),
        )
      ],
    );
  }
}
