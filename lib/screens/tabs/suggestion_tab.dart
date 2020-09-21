import 'package:flutter/material.dart';
import 'package:ytsbloc/widgets/user_widget.dart';

class SuggestionTab extends StatefulWidget {
  @override
  _SuggestionTabState createState() => _SuggestionTabState();
}

class _SuggestionTabState extends State<SuggestionTab> {
  @override
  Widget build(BuildContext context) {
    return UserWidget();
  }
}
