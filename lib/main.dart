import 'package:festival_post_maker_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(
        size.width,
        size.height,
      ),
      builder: (context, child,) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: Routes.myRoutes,
        );
      },
    );
  }
}
