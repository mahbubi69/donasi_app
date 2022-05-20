import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/core/model/model_program.dart';
import 'package:donasi_app/core/repository/repository.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:donasi_app/view/widget/home/detail_list_item_program.dart';
import 'package:donasi_app/view/widget/home/header_box.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  var repoGetProgram;

  @override
  void initState() {
    super.initState();
    repoGetProgram = Repository().getProgramRepo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeaderBox(
          size: size,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (index) => DetailListItemProgram(
                                        images: BASE_URL + program.banner,
                                        deskripsi: program.story)));
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(kDefaultPadding),
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: kprimary,
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
                                    color: pink,
                                  ),
                                  Text(
                                    // '',
                                    '' + program.title,
                                    style: const TextStyle(
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
                                    style: TextStyle(
                                        color: kTextColor,
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
}
