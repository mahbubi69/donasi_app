import 'dart:async';
import 'package:donasi_app/colors/colors.dart';
import 'package:donasi_app/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // height: double.infinity,
        // width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [pink, pink],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/bg_splash_screen.png',
              height: 300.0,
              width: 300.0,
            ),
            //loading
            SizedBox(
              height: size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.9,
                center: const Text("90.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: kprimary,
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),

            const Text(
              'Salurkan donasi untuk membantu sesama',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),

            const Text(
              'vesion 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ],
        ),
        // CircularProgressIndicator(),
      ),
    );
  }
}
