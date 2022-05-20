import 'package:donasi_app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailListItemProgram extends StatelessWidget {
  final String images, deskripsi;
  // final BuildContext context;
  // namaPanti, noHp;
  const DetailListItemProgram({
    Key? key,
    required this.images,
    required this.deskripsi,
    // required this.context,
    // required this.namaPanti,
    // required this.noHp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: pink,
          title: const Text('Deskripsi'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                height: 250.0,
                child: Hero(
                  tag: 'photo panti',
                  child: InkWell(
                    child: Image.network(
                      images,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          'Deskripsi',
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ]),
              //deskripsi
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: kprimary,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      deskripsi,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              //nomor hp dan rekening
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
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
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
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
                          'Tenggarang-Bondowoso',
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Icon(
                          Icons.phone_enabled_outlined,
                          color: pink,
                        ),
                        Text(
                          '0815664785474',
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        Icon(
                          Icons.credit_card_outlined,
                          color: pink,
                        ),
                        Text(
                          '475788587547578',
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //button
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    color: pink,
                    onPressed: () {},
                    child: const Text(
                      'Donasi',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
