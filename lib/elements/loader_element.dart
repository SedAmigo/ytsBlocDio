import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ytsbloc/utils/appcolor.dart';
Widget buildLoadingWidget(){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        const SpinKitPouringHourglass(color: AppColor.mainColor),
      ],
    ),
  );
}