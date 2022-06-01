import 'package:donasi_app/colors/colors.dart';
import 'package:flutter/material.dart';

class HeaderTop extends StatelessWidget {
  const HeaderTop({Key? key, required this.size}) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 0,
            ),
            // height: size.height * 0.2 - 29,
            decoration: const BoxDecoration(
              color: amber,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: size.height * 5,
                ),
                Text('Report Donasi',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: kTextColor, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
