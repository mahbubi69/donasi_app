import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class ListItemReportDonasi extends StatelessWidget {
  const ListItemReportDonasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Image.asset(
                'assets/images/panti_asuhan.jpg',
                fit: BoxFit.cover,
                height: 240,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
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
                    fontWeight: FontWeight.bold, color: pink, fontSize: 24),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
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
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: pink, fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'hapus',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          fontSize: 17),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
