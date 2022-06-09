import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/core/repository/repository.dart';
import 'dart:io';

import 'package:donasi_app/core/response/resp_profile_user.dart';
import 'package:donasi_app/core/utils/value.dart';
import 'package:donasi_app/view/screen/edit_profile_screen.dart';
import 'package:donasi_app/view/screen/login_screen.dart';
import 'package:donasi_app/view/screen/setting_screen.dart';
import 'package:donasi_app/view/widget/Profile/body_detail_profile.dart';
import 'package:donasi_app/view/widget/Profile/profile_menu_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class BodyPofile extends StatefulWidget {
  const BodyPofile({Key? key}) : super(key: key);

  @override
  State<BodyPofile> createState() => _BodyPofileState();
}

class _BodyPofileState extends State<BodyPofile> {
  final Repository repositoryUser = Repository();
  File? imageFile;

  var getProfileId;
  var uploadImage;
  var logger = Logger();

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
                    Container(
                      // margin:
                      //     EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: CircleAvatar(
                        radius: 71,
                        backgroundColor: kTextColor,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundColor: kTextColor,
                          backgroundImage:
                              // NetworkImage(BASE_URL + profile!.data.image),
                              imageFile == null
                                  ?  profile?.data.image.isEmpty ?? true
                                      ? const AssetImage(
                                              'assets/icon/icon_user.png')
                                          as ImageProvider
                                      : NetworkImage(
                                          BASE_URL + profile!.data.image)
                                  : FileImage(imageFile!),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -16,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: FloatingActionButton(
                          backgroundColor: amber,
                          onPressed: () => chooseImage(context),
                          child: SvgPicture.asset(
                            'assets/svg/ic_camera.svg',
                            color: kTextColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                profile!.data.email,
                style: const TextStyle(fontSize: 20, color: Colors.black54),
              ),
              const SizedBox(height: 50),
              ProfileMenuStyle(
                text: 'My Account',
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailProfile(
                                nama: profile.data.name,
                                alamat: profile.data.alamat,
                                tglLahir: profile.data.tglLahir,
                                noHp: profile.data.noHp,
                                onpres: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditProfileScreen()));
                                },
                                image: profile.data.image.isEmpty ?? true
                                    ? const AssetImage(
                                            'assets/icon/icon_user.png')
                                        as ImageProvider
                                    : NetworkImage(
                                        BASE_URL + profile.data.image),
                                onpresImage: () {},
                              )));
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
                  showLogoutDialog('Logout', 'Apakah anda yakin mau keluar');
                },
                icon: 'assets/svg/ic_logout.svg',
              ),
            ]);
          }
        },
      ),
    );
  }

  //dialog profile
  Future<void> showDialogProfile(
    BuildContext ctx,
    ImageProvider imgProf,
  ) {
    return showDialog(
        context: ctx,
        builder: (ctx) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: amber,
                ),
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(ctx).size.width * 0.7,
                height: 325,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: 200,
                        height: 180,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5),
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imgProf,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
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
                        onTap: () {
                          // deletImgProfileSubmit();
                          deletImageSubmit();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(children: const [
                            Icon(Icons.delete, size: 24, color: Colors.black),
                            SizedBox(width: 16),
                            Text("Hapus", style: TextStyle(fontSize: 16))
                          ]),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // uploadImageSubmit(imageFile!, context);
                          imageFile == null
                              ? messageImage(
                                  'Error', "tidak ada file yang di pilih")
                              : uploadImageSubmit(imageFile!);
                          // uploadImageSubmit(imageFile!);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(children: const [
                            Icon(Icons.upload_file_outlined,
                                size: 24, color: Colors.black),
                            SizedBox(width: 16),
                            Text("save imge", style: TextStyle(fontSize: 16))
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

//dialog logout
  Future<void> showLogoutDialog(String title, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final removeToken = await prefs.remove('Token');
              final removeId = await prefs.remove('Id');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Text('Ok'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            child: const Text('tidak'),
          ),
        ],
      ),
    );
  }

  // //parse to file
  // Future<File> assetsParseFile(String path) async {
  //   final byteData = await rootBundle.load('assets/$path');
  //   final file = File('${(await getTemporaryDirectory()).path}$path');
  //   await file.writeAsBytes(byteData.buffer
  //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  //
  //   return file;
  // }
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<void> deletImageSubmit() async {
    final prefs = await SharedPreferences.getInstance();
    var prefid = prefs.getInt('Id');
    var prefToken = prefs.getString('Token');
    int? id = prefid;
    String? token = prefToken, title = 'image';
    // File fileImage = await assetsParseFile('icons/icon_user.png');
    File fileImg = File('assets/icons/icon_user.png');

    var response =
        await repositoryUser.deletImgProfileRepo(token!, id!, title, fileImg);
    if (response.status == 200) {
      // logger.d(response.token!.toString());
      try {
        messageImage('Berhasil', "berhasil delet image");
      } catch (e) {
        print(e);
      }
    } else {
      messageImage('Error', "delet image gagal");
    }
  }

  //upload image submit
  Future<void> uploadImageSubmit(File imageFiles) async {
    final prefs = await SharedPreferences.getInstance();
    var prefid = prefs.getInt('Id');
    var prefToken = prefs.getString('Token');
    int? id = prefid;
    String? token = prefToken;

    var response =
        await repositoryUser.editImageProfileRepo(token!, id!, imageFiles);
    if (response.status == 200) {
      // logger.d(response.token!.toString());
      try {
        messageImage('Berhasil', response.message);
      } catch (e) {
        print(e);
      }
    } else {
      messageImage('Error', response.message);
    }
  }

//fun in get profile
  Future<ResponseProfileUser> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    var prefid = prefs.getInt('Id');
    var prefToken = prefs.getString('Token');

    int? id = prefid;
    String? token = prefToken;
    var repoGetUser = repositoryUser.getProfileRepo(id!, token!);
    return repoGetUser;
  }

  Future<void> messageImage(String title, message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
