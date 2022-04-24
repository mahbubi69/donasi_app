import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class ListItemProgram extends StatelessWidget {
  // final Product produk;
  final VoidCallback press;
  const ListItemProgram({
    Key? key,
    // required this.produk,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            color: kprimary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(
            'assets/images/panti_asuhan.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Icon(
              Icons.home_outlined,
              color: pink,
            ),
            Text(
              'Yarnima',
              style: TextStyle(
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.5),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Icon(
              Icons.location_on_outlined,
              color: pink,
            ),
            Text(
              'tenggarang-bondowoso',
              style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
