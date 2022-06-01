import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/core/model/model_program.dart';
import 'package:donasi_app/core/repository/repository.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:donasi_app/view/widget/home/detail_list_item_program.dart';
import 'package:donasi_app/view/widget/home/header_box.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  var repoGetProgram;
  List<Program> listProgram = [];
  List<Program> searchProgram = [];

  @override
  void initState() {
    super.initState();
    repoGetProgram = Repository().getProgramRepo();
  }

  TextEditingController searchController = TextEditingController();

  // searchProgramData(String nama) {
  //   searchProgram.clear();
  //   if (nama.isEmpty) {
  //     setState(() {});
  //     return;
  //   }

  //   listProgram.forEach((f) {
  //     if (f.title.contains(nama) || f.id.toString().contains(nama))
  //       searchProgram.add(f);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeaderBox(
          size: size,
          onChange: (String) {},
          searchController: searchController,
        ),
        Container(
          child: FutureBuilder<List<Program>>(
              future: repoGetProgram,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  List<Program> dataProgram = snapshot.data;
                  print(dataProgram.length);
                  return Expanded(
                    child: GridView.builder(
                      // onPressed: () {},
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: dataProgram.length,
                      itemBuilder: ((context, index) {
                        Program program = dataProgram[index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              prefSetIdProgram(program.id);
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (index) => DetailListItemProgram(
                                          images: BASE_URL + program.banner,
                                          deskripsi: program.deskripsi,
                                          namaPanti: program.namaPanti,
                                          lokasi: program.lokasi,
                                          noHp: program.kontak,
                                          rekening: program.nomorRekening,
                                        )));
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(kDefaultPadding),
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: amber,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.network(
                                  // '',
                                  BASE_URL + program.banner,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const Icon(
                                    Icons.home_outlined,
                                    color: amber,
                                  ),
                                  Text(
                                    program.namaPanti,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.5),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: amber,
                                  ),
                                  Text(
                                    program.lokasi,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  );
                }
              }),
        )

        // ListItemProgram()
      ],
    );
  }

//cari nama program
  seacrhProgram(String query) {}
}
