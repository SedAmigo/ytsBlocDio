import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension DoubleExtension on num {
  // use for all static height throughout the entire app
  double get flexibleHeight => ScreenUtil().setHeight(this) as double;
  // use for all static width throughout the entire app
  double get flexibleWidth => ScreenUtil().setWidth(this) as double;
  // use for all font size throughout the entire app
  double get flexibleFontSize => ScreenUtil().setSp(this) as double;

  /// Use to add horizontal space
  SizedBox get horizontalSpace => SizedBox(width: flexibleWidth);
  // Use to add vertical space
  SizedBox get verticalSpace => SizedBox(height: flexibleHeight);
}
