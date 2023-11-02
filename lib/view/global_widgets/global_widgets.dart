// ignore_for_file: sort_child_properties_last

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rose_excellence/constants/constants/constant.dart';
import 'package:rose_excellence/view/global_widgets/widgets/boxshadow.dart';
import '../../constants/app_colors/app_colors.dart';

class GlobalWidgets {
  static Widget MyTextField(
      {required String hint,
      double? hintFontSize,
      required TextEditingController controller,
      bool? hiddenText,
      String? Function(String?)? validation,
      String? suffixIconUrl}) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          validator: validation ??
              (value) {
                return value;
              },
          obscureText: hiddenText ?? false,
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: suffixIconUrl == null
                  ? SizedBox()
                  : Image(
                      image: AssetImage('${suffixIconUrl}'),
                    ),
              hintText: '${hint}',
              hintStyle: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: hintFontSize ?? 13,
                  fontWeight: FontWeight.w500),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
        ));
  }

  static Widget MyButton(
      {required double width,
      var text,
      double? height,
      required Color bgColor,
      required void Function() onTap}) {
    print('pritning runtimetype ${text.runtimeType}');
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width * 0.8,
        child: Center(
            child: text.runtimeType == String
                ? Text(
                    '${text}',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  )
                : text),
        decoration: BoxDecoration(
            border: Border.all(color: Constants.orrangeColor),
            color: bgColor,
            borderRadius: BorderRadius.circular(25)),
      ),
    );
  }

  static Widget dualText(
      {required String firstText,
      required String secondText,
      required void Function() ontap,
      FontWeight? fontWeighttForFirstText,
      FontWeight? fontWeighttForSecondText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${firstText}',
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: fontWeighttForFirstText ?? FontWeight.normal,
              fontSize: 15),
        ),
        SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: ontap ?? () {},
          child: Text(
            '${secondText}',
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: fontWeighttForSecondText ?? FontWeight.w600,
                fontSize: 14),
          ),
        ),
      ],
    );
  }

  static Widget CustomButton(
      {required BuildContext context,
      required Widget text,
      double? width,
      double? height,
      required void Function() customOnTap,
      required Color color,
      Color? borderColor,
      Color? textColor}) {
    return GestureDetector(
      onTap: customOnTap,
      child: Container(
        height: height ?? 50,
        width: width ?? MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            boxShadow: shadowList(),
            color: color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: borderColor ?? Colors.transparent, width: 1.5)),
        child: Center(child: text),
      ),
    );
  }

  static Widget CustomTextField(
      {required TextEditingController controller,
      required String hintText,
      bool? isVisible,
      var style,
      void Function()? suffixIconOnTap,
      Widget? suffixIcon,
      String? Function(String? value)? validator,
      FocusNode? focusNode,
      Color? textStyleColor}) {
    return TextFormField(
      obscureText: isVisible ?? false,
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      style: TextStyle(color: textStyleColor ?? Colors.black),
      decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: suffixIconOnTap,
              child: suffixIcon ??
                  Container(
                    height: 0,
                    width: 0,
                  )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red, width: 2)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.HINT_COLOR, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.DARK_GREEN, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.DARK_GREEN, width: 2)),
          hintText: hintText,
          hintStyle: TextStyle(color: textStyleColor ?? Colors.black)),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  MyTextWidget(
      {super.key,
      this.onClick,
      this.text,
      this.textColor = Colors.grey,
      this.fontSize,
      this.fontWeight});
  String? text;
  Color? textColor;
  double? fontSize;
  FontWeight? fontWeight;
  GestureTapCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Text(
        text!,
        style: GoogleFonts.raleway(
            textStyle: TextStyle(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight)),
      ),
    );
  }
}
