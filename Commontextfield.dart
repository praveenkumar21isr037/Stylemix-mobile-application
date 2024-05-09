import 'package:flutter/material.dart';
import 'package:garments/Common/Common%20Textstyle.dart';

Widget commontext(String text,controller){
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        hintText: text,
        hintStyle: producttxt,
        filled: true,
        fillColor: Colors.grey.shade300,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)
        )
    ),
  );
}
