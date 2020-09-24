import 'package:flutter/material.dart';
import 'package:ytsbloc/utils/appcolor.dart';

Widget buildErrorWidget(String error) {
  return Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_outlined,
            color: AppColor.mainColor,
            size: 200.0,
          ),
          Text(
            error,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: AppColor.mainColor,
            ),
          ),
        ],
      ),
    ),
  );
}
