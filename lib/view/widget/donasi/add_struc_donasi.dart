import 'dart:io';

import 'package:donasi_app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStruckDonasi extends StatefulWidget {
  const AddStruckDonasi({Key? key}) : super(key: key);

  @override
  State<AddStruckDonasi> createState() => _AddStruckDonasiState();
}

class _AddStruckDonasiState extends State<AddStruckDonasi> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      getCamra();
                    },
                    child: Stack(
                      children: [
                        // imageFile == null
                        //     ? Image.asset(
                        //         'assets/icons/camera_donasi.png',
                        //         height: size.height * 0.40,
                        //       )
                        //     : FileImage(File(imageFile!) as ImageProvider)
                      ],
                    ),
                  ),
                  //button
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        color: amber,
                        onPressed: () {
                          setState(
                            () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const NavigationBarStyle()));
                            },
                          );
                        },
                        child: const Text(
                          'Upload',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  // chek akun
                ],
              ),
            )
          ],
        ),
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
                              Text("Dari Galeri",
                                  style: TextStyle(fontSize: 16))
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
    }
  }
}
