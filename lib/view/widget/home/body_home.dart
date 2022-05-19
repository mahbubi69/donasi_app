import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/core/model/model_donasi.dart';
import 'package:donasi_app/core/repository/repository.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:donasi_app/view/widget/home/header_box.dart';
// import 'package:donasi_app/view/widget/home/list_item_Program.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  var repoGetProgram;

  @override
  void initState() {
    // TODO: implement initState
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: dataProgram.length,
                      itemBuilder: ((context, index) {
                        Program program = dataProgram[index];
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
                              child: Image.network(
                                // '',
                                BASE_URL + program.banner,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.home_outlined,
                                  color: pink,
                                ),
                                Text(
                                  // '',
                                  '' + program.title,
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
                                  style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
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
