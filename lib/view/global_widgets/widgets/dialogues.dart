import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rose_excellence/view/global_widgets/widgets/simple_login_dialogue.dart';
import '../../../../constants/constants/constant.dart';
import '../dialogues/dialogues.dart';
import 'login_dialogue.dart';

class GeneralDialogs {
  static Future showSuccessDialog(context, String message) {
    return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context, true);
        });
        return SuccessDialog(
          message: message,
        );
      },
    );
  }

  static Future showLoginDialogue(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomDialogBox(
            title: 'title',
            descriptions: 'descriptions',
            text: 'text',
            );
      },
    );
  }
  static Future showLoginAlertDialogue(
      {context, required String firstNote, required String secondNote}) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleLoginDialogue(
         firstNote: firstNote,
          secondNote: secondNote,
        );
      },
    );
  }

  static Future showSimpleDialog(context, String message) {
    return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context, true);
        });
        return SimpleDialog(
          message: message,
        );
      },
    );
  }

  static Future showOopsDialog(context, String message) {
    return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context, true);
        });
        return OopsDialog(
          message: message,
        );
      },
    );
  }

  static Future showSomethingWentWrongDialog(context, {String? message}) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context, true);
    });
    return GeneralDialogs.showOopsDialog(
      context,
      "Sorry, something went wrong\n\nPlease try again later." +
          (message == null ? "" : "\n\nDetails: $message"),
    );
  }
}

class SimpleDialog extends StatelessWidget {
  final String message;
  const SimpleDialog({Key? key, required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      backgroundColor: CupertinoColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Color(0xfff4115c), width: 2)),
      content: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(fontSize: 15, color: Color(0xfff4115c)),
              textAlign: TextAlign.center,
            ),
            //SizedBox(height: 30),
            /*Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.4,
              child: NormalButton(
                buttonText: "OK",
                onTap: () => Navigator.pop(context),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}

class OopsDialog extends StatelessWidget {
  final String message;

  const OopsDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      backgroundColor: CupertinoColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.red, width: 2)),
      content: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'OOPS!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Constants.orrangeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            //SizedBox(height: 30),
            /*Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.4,
              child: NormalButton(
                buttonText: "OK",
                onTap: () => Navigator.pop(context),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String message;

  SuccessDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      backgroundColor: CupertinoColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Constants.orrangeColor, width: 2)),
      content: Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Constants.orrangeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
