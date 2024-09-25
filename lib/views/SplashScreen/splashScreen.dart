import 'dart:async';

import 'package:festival_post_maker_app/routes/routes.dart';
import 'package:festival_post_maker_app/views/HomePage/home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.homePage,
          (route) => false,
        );
      },
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Festivize",
              style: GoogleFonts.roboto(
                fontSize: 32.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "A Festival Post Maker App",
              style: GoogleFonts.roboto(
                fontSize: 15.sp,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Lottie.asset(
              "assets/loader.json",
              width: 150.w,
              height: 250.h,
            ),
          ],
        ),
      ),
    );
  }
}
