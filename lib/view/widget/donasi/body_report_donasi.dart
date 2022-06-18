import 'dart:async';

import 'package:cron/cron.dart';
import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/core/model/model_donasi.dart';
import 'package:donasi_app/core/repository/repository.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:donasi_app/view/widget/donasi/add_struc_donasi.dart';
import 'package:donasi_app/view/widget/donasi/header_top.dart';
import 'package:donasi_app/view/widget/home/notification_widget.dart';
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
  final cron = Cron();
  var timeCron;
  // final keyRefresh = GlobalKey<RefreshIndicatorState>();
  Future<Null> refresList() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  void initState() {
    super.initState();
    NotificationWidget.init();
  }

  schedulAutoDeletDonasi(int id) {
    cron.schedule(
        Schedule.parse('*/9 * * * *'),
        () async => {
              deletDonasiSubmit(id),
              NotificationWidget.showNotification(
                  title: 'Notifikasi',
                  body: 'anda telat membagikan srtuk anda'),
            });
  }

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
        // RefreshIndicator(
        //   onRefresh: refresList,
        //   backgroundColor: amber,
        // child:
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
                          color: primaryAmber,
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
                                                'assets/icon/camera_donasi.png',
                                                height: 200,
                                                width: 200,
                                              ),
                                              const Text(
                                                'Tolong segera donasi waktu akan habis',
                                                // 'waktu akan habis ${schedulAutoDeletDonasi(donasi.id)}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.red),
                                              ),
                                              Container(
                                                child: schedulAutoDeletDonasi(
                                                    donasi.id),
                                              ),
                                              Text(
                                                  '${endTimer.inHours} : ${doubleParseTime(endTimer.inMinutes % 60)} ${doubleParseTime(endTimer.inSeconds % 60)}')
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
                                          deletDonasiSubmit(donasi.id);
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
              // );
            }
          },
        ),
        // )
      ],
    );
  }

  String doubleParseTime(int digitTime) {
    if (digitTime < 10) {
      return '0$digitTime';
    } else {
      return '$digitTime';
    }
  }

  Future<void> deletDonasiSubmit(int id) async {
    final prefs = await SharedPreferences.getInstance();
    var prefToken = prefs.getString('Token');
    String? token = prefToken;

    var response = await repoDonasi.deletDonsiRepo(id, token!);
    if (response.status == 200) {
      print(response.message);
    } else {
      print(response.message);
    }
  }
}
