import 'package:flutter/material.dart';

class NotivocationsScreen extends StatefulWidget {
  const NotivocationsScreen({Key? key}) : super(key: key);

  @override
  State<NotivocationsScreen> createState() => _NotivocationsScreenState();
}

class _NotivocationsScreenState extends State<NotivocationsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Notif')),
    );
  }
}
