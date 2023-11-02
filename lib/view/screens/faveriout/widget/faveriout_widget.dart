import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rose_excellence/view/global_widgets/dialogues/delete_dailog.dart';

import '../../../../models/faveriout_modal.dart';

class FaverioutContainer extends StatelessWidget {
  FaverioutContainer({super.key, required this.modal});
  final FaverioutModal modal;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return DeleteDailog();
          },
        );
      },
      child: Container(
        width: 230,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              //   AssetImage('assets/images/shoes.png')
              image: AssetImage(modal.image!)),
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.transparent,
                Colors.transparent,
                Colors.black.withOpacity(0.9)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0, 0, 2.5],
            ),
          ),
          //padding: const EdgeInsets.only(bottom: 14.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Text(
                    modal.title!,
                    //  pickOfTheDay[index].name,
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        //  text: '\$${pickOfTheDay[index].price}',
                        text: modal.price,
                        style: GoogleFonts.ibmPlexSans(
                            color: Colors.yellow,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(3, -4),
                          child: Text(
                            '',
                            style: GoogleFonts.raleway(
                                color: Colors.yellow,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      )
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    // Container(
    //   width: width * 0.3,
    //   height: height * 0.2,
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(20),
    //       image: DecorationImage(
    //           image: AssetImage(modal.image!), fit: BoxFit.fill)),
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizedBox(
    //           height: height * 0.12,
    //         ),
    //         MyTextWidget(
    //           text: modal.title,
    //           fontSize: 15,
    //           textColor: AppColors.BLACK_COLOR,
    //           fontWeight: FontWeight.bold,
    //         ),
    //         MyTextWidget(
    //           text: modal.price,
    //           fontSize: 18,
    //           fontWeight: FontWeight.bold,
    //           textColor: Colors.yellow,
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
