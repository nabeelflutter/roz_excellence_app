import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget LoginOrSignUpPageButton(
    {String? imageUrl,
    required void Function() function,
    Color? backgroundColor,
    required double width,
    required Color color,
    required double height,
    required String buttonText,
    Widget? buttonTextWidget,
    required Color textColor,
    required Color borderColor}) {
  return GestureDetector(
    onTap: function,
    child: Card(
      elevation: 3,
      borderOnForeground: true,
      shadowColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35)),
      ),
      child: Container(
        height: height,
        width: width * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: backgroundColor ?? Colors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageUrl == null
                ? Container()
                : Center(
                    child: Image(
                    image: AssetImage(imageUrl),
                  )),
            const SizedBox(
              width: 10,
            ),
            Center(
                child: buttonTextWidget ??
                    Text(
                      buttonText,
                      style: GoogleFonts.raleway(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))
          ],
        ),
      ),
    ),
  );
}
