import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodySetting extends StatelessWidget {
  const BodySetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Dark Mode',
            style: Theme.of(context).textTheme.button,
          ),
          const SizedBox(
            width: 50,
          ),
          RaisedButton(
              child: Icon(Icons.brightness_6_outlined),
              onPressed: () {
                Get.isDarkMode
                    ? Get.changeTheme(ThemeData.light())
                    : Get.changeTheme(ThemeData.light());
              }),
          // FlutterSwitch(
          //   width: 100,
          //   height: 40.0,
          //   valueFontSize: 18.0,
          //   toggleSize: 45.0,
          //   value: status,
          //   borderRadius: 30.0,
          //   padding: 8.0,
          //   showOnOff: true,
          //   onToggle: (val) {
          //     setState(() {
          //       status = val;

          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}
