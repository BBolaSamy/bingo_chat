import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final Color colorText;
  Color materialColor = Colors.white;
  final Color borderColor;

  final void Function() onPressMethod;

  CustomButtom(
      {@required this.text,
      @required this.width,
      @required this.fontSize,
      @required this.colorText,
      this.height,
      this.materialColor,
      @required this.borderColor,
      @required this.onPressMethod});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: materialColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: this.onPressMethod,
          minWidth: this.width,
          height: this.height,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: borderColor, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10)),
          child: Text(this.text,
              style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.w700,
                fontSize: fontSize,
                color: colorText,
              )),
        ),
      ),
    );
  }
}
