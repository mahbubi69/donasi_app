import 'dart:io';

import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/core/repository/repository.dart';
import 'package:donasi_app/core/response/resp_profile_user.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:donasi_app/view/screen/edit_profile_screen.dart';
import 'package:donasi_app/view/screen/login_screen.dart';
import 'package:donasi_app/view/screen/setting_screen.dart';
import 'package:donasi_app/view/widget/Profile/body_detail_profile.dart';
import 'package:donasi_app/view/widget/Profile/profile_menu_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyPofile extends StatefulWidget {
  const BodyPofile({Key? key}) : super(key: key);

  @override
  State<BodyPofile> createState() => _BodyPofileState();
}

class _BodyPofileState extends State<BodyPofile> {
  final Repository repositoryGetUser = Repository();
  File? imageFile;

  Future<ResponseProfileUser> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    var prefid = prefs.getInt('Id');
    var prefToken = prefs.getString('Token');

    int? id = prefid;
    String? token = prefToken;
    var repoGetUser = repositoryGetUser.getProfileRepo(id!, token!);
    return repoGetUser;
  }

  var getProfileId;
  @override
  void initState() {
    super.initState();
    getProfileId = getProfile();
  }

  @override
  var appBarHeight = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<ResponseProfileUser>(
        future: getProfileId,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            ResponseProfileUser? profile = snapshot.data;
            return Column(children: [
              const SizedBox(height: 90),
              SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  //  CircleAvatar(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          NetworkImage(BASE_URL + profile!.data.image),
                    ),
                    Positioned(
                      right: -16,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: FloatingActionButton(
                          backgroundColor: Colors.green,
                          onPressed: () => chooseImage(context),
                          child: SvgPicture.asset(
                            'assets/svg/ic_camera.svg',
                            color: pink,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                profile.data.email,
                style: TextStyle(fontSize: 20, color: pink),
              ),
              const SizedBox(height: 5),
              const SizedBox(height: 45),
              ProfileMenuStyle(
                text: 'My Account',
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailProfile(
                              nama: profile.data.name,
                              alamat: profile.data.alamat,
                              tglLahir: profile.data.tglLahir.toString(),
                              noHp: profile.data.noHp,
                              onpres: () {
                                setState(() async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditProfileScreen()));
                                });
                              },
                              image: BASE_URL + profile.data.image)));
                },
                icon: 'assets/svg/ic_user.svg',
              ),
              ProfileMenuStyle(
                  text: 'Seetings',
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingScreen()));
                  },
                  icon: 'assets/svg/ic_setting.svg'),
              ProfileMenuStyle(
                text: 'Log Out',
                press: () {
                  setState(() async {
                    final prefs = await SharedPreferences.getInstance();
                    final removeToken = await prefs.remove('Token');
                    final removeId = await prefs.remove('Id');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  });
                },
                icon: 'assets/svg/ic_logout.svg',
              ),
            ]);
          }
        },
      ),
    );
  }

//open camera
  Future getCamra() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this.imageFile = imageTemporary;
    });
  }

//open galery
  Future getGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);

    setState(() {
      this.imageFile = imageTemporary;
    });
  }

//pop menu style
  void chooseImage(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (ctx) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Material(
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () => getCamra(),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(children: const [
                            Icon(Icons.photo_camera,
                                size: 24, color: Colors.black),
                            SizedBox(width: 16),
                            Text("Ambil Foto", style: TextStyle(fontSize: 16))
                          ]),
                        ),
                      ),
                      InkWell(
                        onTap: () => getGallery(),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(children: const [
                            Icon(Icons.image, size: 24, color: Colors.black),
                            SizedBox(width: 16),
                            Text("Dari Galeri", style: TextStyle(fontSize: 16))
                          ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(children: const [
                            Icon(Icons.delete, size: 24, color: Colors.black),
                            SizedBox(width: 16),
                            Text("Hapus", style: TextStyle(fontSize: 16))
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
