import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rose_excellence/constants/constants/constant.dart';

import 'Explore/widget/explore_screen_widget.dart';

class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.orrangeColor,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: () {
          Navigator.pop(context);
        },),
        title: Text('Write a Review',style: GoogleFonts.raleway(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Rate and Review',
              style: GoogleFonts.raleway(fontSize: 24.0, fontWeight: FontWeight.bold,color: Constants.orrangeColor),
            ),
            SizedBox(height: 20.0),
            RatingBar(
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              ratingWidget: RatingWidget(
                full: Icon(Icons.star, color: Colors.amber),
                half: Icon(Icons.star_half, color: Colors.amber),
                empty: Icon(Icons.star_border, color: Colors.amber),
              ),
              onRatingUpdate: (rating) {
                // Handle the rating update
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your review here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            MyOutLineButton(
              followText: "Submit",
              textSize: 18,
              textColor: Colors.white,
              height: 60,
              width: 200,
              borderColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}


