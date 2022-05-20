// ignore_for_file: deprecated_member_use

import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/core/model/model_donasi.dart';
import 'package:donasi_app/core/repository/repository.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:donasi_app/view/widget/report-donasi/header_top.dart';
import 'package:donasi_app/view/widget/report-donasi/list_item_report_donasi.dart';
import 'package:flutter/material.dart';

class BodyReportDonasi extends StatefulWidget {
  const BodyReportDonasi({Key? key}) : super(key: key);

  @override
  State<BodyReportDonasi> createState() => _BodyReportDonasiState();
}

class _BodyReportDonasiState extends State<BodyReportDonasi> {
  var repoDonasi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repoDonasi = Repository().getReportDonasiRepo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // ListItemProgram()
        HeaderTop(size: size),
        Container(
          child: FutureBuilder<List<Donasi>>(
            future: repoDonasi,
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
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: [
                                    Image.network(
                                      BASE_URL + donasi.buktiDonation,
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
                                  children: <Widget>[
                                    const Icon(
                                      Icons.date_range_outlined,
                                      color: pink,
                                    ),
                                    Text(
                                      donasi.dateDonation.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: pink,
                                          fontSize: 17),
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
                                      Icons.money_off_csred_outlined,
                                      color: pink,
                                    ),
                                    Text(
                                      'jumlah donasi',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: pink,
                                          fontSize: 16),
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
                        }));
              }
            },
          ),
        )
        // Expanded(
        //   child: GridView.builder(
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 1,
        //         // childAspectRatio: 0.75,
        //       ),
        //       itemBuilder: (context, index) => const ListItemReportDonasi()),
        // ),
      ],
    );
  }
}
