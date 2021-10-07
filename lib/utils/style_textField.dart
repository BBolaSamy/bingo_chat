import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration getInputTextStyle(
    String text, double textFontSize, Color colorLable) {
  return InputDecoration(
      labelText: text,
      labelStyle: GoogleFonts.comfortaa(
        fontWeight: FontWeight.w300,
        fontSize: textFontSize,
        color: colorLable,
        fontStyle: FontStyle.normal,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      )
      // errorStyle: TextStyle(fontSize: 12)
      );
}
