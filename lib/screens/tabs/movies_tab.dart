import 'package:flutter/material.dart';
import 'package:ytsbloc/widgets/suggestions_slide.dart';

class MoviesTab extends StatefulWidget {
  @override
  _MoviesTabState createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MaterialSlider(),
      ],
    );
  }
}
