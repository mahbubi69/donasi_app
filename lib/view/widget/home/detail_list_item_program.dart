import 'package:donasi_app/colors/colors.dart';
import 'package:flutter/material.dart';

class DetailListItemProgram extends StatefulWidget {
  const DetailListItemProgram({Key? key}) : super(key: key);

  @override
  State<DetailListItemProgram> createState() => DetailListItemProgramState();
}

class DetailListItemProgramState extends State<DetailListItemProgram> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kprimary,
      appBar: AppBar(
        backgroundColor: pink,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250.0,
            child: Hero(
              tag: 'photo panti',
              child: InkWell(
                child: Image.asset(
                  'assets/images/panti_asuhan_1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //nama dan lokasi panti
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
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          // deskripsi
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: const Text(
                  'Deskripsi',
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const Card(
              color: kprimary,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Panti Asuhan Yarhima terletak di daerah Bondowoso Jl. Saliwiryo Pranowo, Pattian, Kotakulon, Kec. Bondowoso, Kab. Bondowoso, Jawa Timur',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
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
          //button
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FlatButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                color: pink,
                onPressed: () {
                  setState(() {
                    // showErrorDialog('error', 'cek anda');
                    // loginSubmit(email, password, context);
                  });
                },
                child: const Text(
                  'Donasi',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
