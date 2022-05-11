import 'dart:io';

import 'package:donasi_app/view/widget/Profile/profile_menu_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../colors/colors.dart';
import '../../screen/detail_pofile_screen.dart';
import '../../screen/setting_screen.dart';

class BodyPofile extends StatefulWidget {
  const BodyPofile({Key? key}) : super(key: key);

  @override
  State<BodyPofile> createState() => _BodyPofileState();
}

class _BodyPofileState extends State<BodyPofile> {
  File? imageFile;

  var appBarHeight = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 90),
          SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              //  CircleAvatar(
              children: [
                imageFile != null
                    ? Image.file(imageFile!)
                    : Image.asset('assets/images/icon_user.png'),

                //   child: Column(

                //   ),

                // ),
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
          const Text(
            'Person User',
            style: TextStyle(fontSize: 20, color: pink),
          ),
          const SizedBox(height: 5),
          const Text('muhammadmahbubi495@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          const SizedBox(height: 45),
          ProfileMenuStyle(
            text: 'My Account',
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailProfileScreen()));
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
            press: () {},
            icon: 'assets/svg/ic_logout.svg',
          ),
        ],
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
