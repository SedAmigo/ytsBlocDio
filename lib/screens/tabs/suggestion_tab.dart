import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ytsbloc/utils/appcolor.dart';

class SuggestionTab extends StatefulWidget {
  @override
  _SuggestionTabState createState() => _SuggestionTabState();
}

class _SuggestionTabState extends State<SuggestionTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_dining,
            color: AppColor.mainColor,
            size: 200.0,
          ),
          const SpinKitWanderingCubes(color: AppColor.mainColor),
          Text(
            'Suggestion\'s in future',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: AppColor.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
