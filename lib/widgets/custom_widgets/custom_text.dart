import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/number_extensions.dart';

class CustomText extends StatefulWidget {
  final String txt;
  final double txtSize;
  final Color txtColor;
  final TextAlign txtAlign;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  const CustomText(
      {Key key,
      @required this.txt,
      this.txtSize,
      this.txtColor,
      this.txtAlign,
      this.fontWeight,
      this.textDecoration})
      : super(key: key);
  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.txt}',
      overflow: TextOverflow.ellipsis,
      textAlign: widget.txtAlign ?? TextAlign.left,
      style: GoogleFonts.workSans(
        textStyle: TextStyle(
          fontSize: widget.txtSize ?? 14.flexibleFontSize,
          fontWeight: widget.fontWeight ?? FontWeight.w600,
          color: widget.txtColor ?? Colors.white,
          decoration: widget.textDecoration,
        ),
      ),
    );
  }
}
