import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:ytsbloc/widgets/custom_widgets/custom_text.dart';
import 'package:ytsbloc/widgets/screen_widgets/movies_list.dart';
import 'package:ytsbloc/widgets/screen_widgets/suggestions_slide.dart';
import '../../utils/number_extensions.dart';

class MoviesTab extends StatefulWidget {
  @override
  _MoviesTabState createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375,
      height: 812,
      allowFontScaling: false,
    );
    return ListView(
      children: [
        MaterialSlider(),
        20.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    txt: 'Browse Movies',
                    txtSize: 20.flexibleFontSize,
                    textDecoration: TextDecoration.underline,
                  ),
                  10.horizontalSpace,
                  Icon(
                    EvaIcons.arrowDown,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ],
              ),
              20.verticalSpace,
              MovieList(),
            ],
          ),
        ),
      ],
    );
  }
}
