import 'package:festival_post_maker_app/globals/festival_list.dart';
import 'package:festival_post_maker_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ContainerFest({
  required int index,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(
        context,
        Routes.detailPage,
        arguments: fest[index],
      );
    },
    child: Container(
      height: 220.h,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent.shade100,
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.lightBlueAccent.shade100,
        //     Colors.tealAccent.shade100
        //   ],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fest[index].fName,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            fest[index].fDesc,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                color: Colors.black,
                size: 20.sp,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                '${fest[index].fDate} ${fest[index].fMonth}',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
