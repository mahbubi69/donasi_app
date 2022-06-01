import 'package:donasi_app/colors/colors.dart';
import 'package:flutter/material.dart';

class HeaderBox extends StatelessWidget {
  HeaderBox({
    Key? key,
    required this.size,
    required this.onChange,
    required this.searchController,
  }) : super(key: key);

  final Size size;
  Function(String) onChange;
  TextEditingController searchController;

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
                Text('Donasi App',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: kTextColor, fontWeight: FontWeight.bold)),
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
                    color: amber.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: onChange,
                      decoration: const InputDecoration(
                        hintText: 'cari',
                        hintStyle: TextStyle(
                          color: amber,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                    color: amber,
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
