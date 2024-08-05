import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed('Home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/quotes.png',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            const Text(
              "quotes",
              style: TextStyle(
                  fontFamily: "f1", fontSize: 20, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
