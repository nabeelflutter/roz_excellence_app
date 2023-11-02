// ignore_for_file: must_be_immutable, prefer_if_null_operators

import 'package:flutter/material.dart';
import '../../../../constants/constants/constant.dart';
import '../../../constants/app_colors/app_colors.dart';

Widget CustomTextField(double width, String hint,
    {int? backgroundColor,
    int? maxKine,
    Widget? prefix,
    TextEditingController? textEditingController,
    bool isDense = true} /*,{ String? prefixIconUrl, String? suffixIconUrl}*/) {
  TextEditingController textEditingControllerr = TextEditingController();
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      width: width * 0.95,
      child: Container(
        color: backgroundColor == null ? Colors.white : Color(backgroundColor),
        child: TextFormField(
            maxLines: maxKine,
            controller: textEditingController != null
                ? textEditingController
                : textEditingControllerr,
            decoration: InputDecoration(
                prefixIcon: prefix,
                isDense: isDense,
                /*prefixIcon: prefixIconUrl==null? Container() : Image(image: AssetImage(prefixIconUrl),),
              suffixIcon: suffixIconUrl==null? Container() :Image(image: AssetImage(suffixIconUrl),),*/
                hintText: hint,
                hintStyle: TextStyle(color: Constants.randomTextColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.DARK_GREEN,
                      width: 2,
                      style: BorderStyle.solid),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.3))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.DARK_GREEN, width: 2)))),
      ));
}

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      this.controller,
      this.hint,
      this.keybord,
      this.suffix,
      this.prefix,
      this.width});
  double? width;
  TextInputType? keybord;

  String? hint;
  Widget? prefix;
  Widget? suffix;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: TextFormField(
          keyboardType: keybord,
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: suffix,
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              prefixIcon: prefix,
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white))),
        ));
  }
}
