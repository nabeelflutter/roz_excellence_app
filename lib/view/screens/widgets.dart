
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants/constant.dart';


class GlobalWidgetsTwo {
  static Widget MyTextField(
      {required String hint,
        double? hintFontSize,
         TextInputType? type,
        required TextEditingController controller,
        bool? hiddenText,
        String? Function(String?)? validation,
        String? suffixIconUrl}) {
    return Container(
        height: 50,

        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: TextFormField(

          keyboardType: type,
          validator: validation ?? (value) {
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
              hintStyle: GoogleFonts.poppins(color: Colors.brown,fontSize: hintFontSize ?? 13,fontWeight: FontWeight.w500),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
        ));
  }

  static Widget MyTextFieldd(
      {required String hint,
        required TextEditingController controller,
        TextInputType? inputType,

        String? suffixIconUrl}) {
    return Container(
        height: 50,
        decoration: BoxDecoration(

            color: Colors.blue, borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          keyboardType: inputType,
          controller: controller,
          decoration: InputDecoration(

              suffixIcon: suffixIconUrl == null
                  ? SizedBox()
                  : Image(
                image: AssetImage('${suffixIconUrl}'),
              ),
              hintText: '${hint}',
              hintStyle: GoogleFonts.poppins(color: Colors.black),
              fillColor: Colors.white,

              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15))),
        ));
  }

  static Widget MyButton(
      {required double width,
        var text,
        double? height,
        required Color bgColor,
        Color? textColor,
        required void Function() onTap}) {
    print('pritning runtimetype ${text.runtimeType}');
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width * 0.8,
        child: Center(
            child: text.runtimeType == String ? Text(
              '${text}',
              style: GoogleFonts.poppins(
                  color: Constants.orrangeColor, fontWeight: FontWeight.w500, fontSize: 18),
            ) : text),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
  static Widget socialLoginButtons(context,{VoidCallback? facebookFunction,VoidCallback? googleFunction,VoidCallback? appleFunction}) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "facebook",
            backgroundColor: Colors.white,
            elevation: 10,
            onPressed: facebookFunction,
            child: Image.asset('assets/images/fb_icon.png'),
          ),
          SizedBox(width: 20,),
          FloatingActionButton(
            heroTag: "linkedin",
            backgroundColor: Colors.white,
            elevation: 10,
            onPressed: googleFunction,
            child: Image.asset(
              'assets/images/google_icon.png',

            ),
          ),
          SizedBox(width: 20,),

          FloatingActionButton(
            heroTag: "twitter",
            backgroundColor: Colors.white,
            elevation: 10,
            onPressed:appleFunction,
            child: Image.asset('assets/images/apple_icon .png'),
          ),
        ],
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









  static Widget SplashWidget() {
    return Container(
      child: Center(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/m_splash.png')))),
      ),
    );
  }




  static Widget TextAreaa(double width, String hint,

      {Color? textColor,
        FocusNode? focusNode,
        Color? backgroundColor,
        Future? saveForm,
        int? maxLines,
        TextEditingController?
        textEditingController} /*,{ String? prefixIconUrl, String? suffixIconUrl}*/) {
    // TextEditingController textEditingControllerr = TextEditingController();
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        width: width ,
        height: 150,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: backgroundColor == null ? Colors.white : backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(


              validator: (title) =>
              title != null && title.isEmpty ? 'Title cannot be empty' : null,
              onFieldSubmitted: (_) => saveForm,
              focusNode: focusNode,
              maxLines: maxLines??4,

              style:
              GoogleFonts.poppins(color: textColor == null ? Colors.black : textColor),
              controller: textEditingController,
              decoration: InputDecoration(
                /*prefixIcon: prefixIconUrl==null? Container() : Image(image: AssetImage(prefixIconUrl),),
              suffixIcon: suffixIconUrl==null? Container() :Image(image: AssetImage(suffixIconUrl),),*/
                hintText: hint,
                hintStyle: GoogleFonts.poppins(color:Colors.brown),


              )),
        ));
  }
}