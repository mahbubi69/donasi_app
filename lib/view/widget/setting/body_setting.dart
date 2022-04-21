import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BodySetting extends StatelessWidget {
  BodySetting({
    Key? key,
    this.light = true,
    required this.onTap,
  }) : super(key: key);

  final bool light;
  late VoidCallback onTap;

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
            width: 30,
          ),
          Switch(
            value: light,
            onChanged: (state) {
              onTap = state as VoidCallback;
            },
          ),
        ],
      ),
    );
  }
}
