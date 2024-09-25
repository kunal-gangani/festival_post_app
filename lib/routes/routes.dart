import 'package:festival_post_maker_app/views/DetailPage/detail_page.dart';
import 'package:festival_post_maker_app/views/HomePage/home_Page.dart';
import 'package:festival_post_maker_app/views/SplashScreen/splashScreen.dart';
import 'package:flutter/material.dart';

class Routes {
  static String splashScreen = "/";
  static String homePage = "home_page";
  static String detailPage = "detail_page";

  static Map<String, WidgetBuilder> myRoutes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    detailPage: (context) => const DetailPage(),
  };
}
