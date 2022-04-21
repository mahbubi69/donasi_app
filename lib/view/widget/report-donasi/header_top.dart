import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

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
            height: size.height * 0.2 - 29,
            decoration: const BoxDecoration(
              color: kprimary,
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
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: pink, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kprimary.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        hintText: 'cari',
                        hintStyle: TextStyle(
                          color: pink,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                    color: pink,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
