// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/core/model/model_donasi.dart';
import 'package:donasi_app/core/repository/repository.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:donasi_app/view/widget/donasi/add_struc_donasi.dart';
import 'package:donasi_app/view/widget/donasi/header_top.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyReportDonasi extends StatefulWidget {
  const BodyReportDonasi({Key? key}) : super(key: key);

  @override
  State<BodyReportDonasi> createState() => _BodyReportDonasiState();
}

class _BodyReportDonasiState extends State<BodyReportDonasi> {
  final Repository repoDonasi = Repository();
  Image? imageFile;
  Duration endTimer = Duration(hours: 1);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // repoDonasi = Repository();
    // timer = Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {
    //     endTimer -= Duration(seconds: 1);
    //   });
    // });
  }

  // String parseDigitTimer(int digit) {
  //   if (digit < 10) {
  //     return '0$digit';
  //   } else {
  //     return '$digit';
  //   }
  // }

  getParseFormateDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeaderTop(size: size),
        FutureBuilder<List<Donasi>>(
          future: repoDonasi.getReportDonasiRepo(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              List<Donasi> dataDonasi = snapshot.data;
              return Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        // childAspectRatio: 0.75,
                      ),
                      itemCount: dataDonasi.length,
                      itemBuilder: (context, index) {
                        Donasi donasi = dataDonasi[index];
                        var parseDate =
                            getParseFormateDate(donasi.dateDonation.toString());
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          color: amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: [
                                  donasi.buktiDonation.isEmpty ?? true
                                      ? GestureDetector(
                                          onTap: () {
                                            prefSetIdDonasi(donasi.id);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (index) =>
                                                        AddStruckDonasi()));
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/icons/camera_donasi.png',
                                                height: 200,
                                                width: 200,
                                              ),
                                              const Text(
                                                'waktu akan habis',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.red),
                                              ),
                                              // Text(
                                              // '${endTimer.inHours} : ${parseDigitTimer(endTimer.inMinutes % 60)} ${parseDigitTimer(endTimer.inSeconds % 60)}')
                                            ],
                                          ))
                                      : Image.network(
                                          BASE_URL + donasi.buktiDonation,
                                          height: 250,
                                          width: 250,
                                        )
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const Icon(
                                    Icons.date_range_outlined,
                                    color: amber,
                                  ),
                                  Text(
                                    parseDate,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const Icon(
                                    Icons.money_off_csred_outlined,
                                    color: amber,
                                  ),
                                  Text(
                                    'Rp.' + donasi.jumlahDonasi.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
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
                                        onPressed: () {
                                          deletDonasiSubmit(
                                              donasi.id.toString());
                                        },
                                        child: const Text(
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
                      }));
            }
          },
        )
      ],
    );
  }

  Future<void> deletDonasiSubmit(String id) async {
    final prefs = await SharedPreferences.getInstance();
    var prefToken = prefs.getString('Token');

    var response = await repoDonasi.deletDonsiRepo(id, prefToken);
    if (response.status == 200) {
      print(response.message);
    } else {
      print(response.message);
    }
  }
}
