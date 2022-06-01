import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/core/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UbahEmailPassword extends StatefulWidget {
  const UbahEmailPassword({Key? key}) : super(key: key);

  @override
  State<UbahEmailPassword> createState() => _UbahEmailPasswordState();
}

class _UbahEmailPasswordState extends State<UbahEmailPassword> {
  bool isObscure = true;
  String password = '', id = '', token = '';
  TextEditingController passwordControll = TextEditingController();
  TextEditingController konfirmasiPasswordControll = TextEditingController();

  final Repository repository = Repository();
  var logger = Logger();
  @override
  void initState() {
    super.initState();
    passwordControll = TextEditingController();
    konfirmasiPasswordControll = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: amber,
          title: const Text('ubah psasword'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  obscureText: isObscure,
                  controller: passwordControll,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  obscureText: isObscure,
                  controller: konfirmasiPasswordControll,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Konfirmasi Passeord',
                      hintText: 'konfirmasi Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                      )),
                ),
              ),
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
                      ubahPasswordSubmit(password, id, token);
                    },
                    child: const Text(
                      'Konfirmasi',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }

  Future<void> ubahPasswordSubmit(
    String konfirmasiPassword,
    id,
    token,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    var prefid = prefs.getInt('Id');
    var prefToken = prefs.getString('Token');

    String idUser = prefid.toString();
    String? tokenUser = prefToken;
    String password = passwordControll.value.text;
    konfirmasiPassword = konfirmasiPasswordControll.value.text;
    id = idUser;
    token = prefToken;

    if (password == konfirmasiPassword) {
      var response =
          await repository.editPasswordRepo(konfirmasiPassword, id, token);
      if (response.status == 200) {
        showEditPasswrordDialog('Berehasil', response.message);
      }
    } else {
      showEditPasswrordDialog(
          'gagal', 'konfirmasi password tolong cek kembali');
    }
  }

  Future<void> showEditPasswrordDialog(String title, message) {
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
