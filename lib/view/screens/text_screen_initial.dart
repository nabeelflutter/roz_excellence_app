import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Initial extends StatefulWidget {
  String id;
  Initial({required this.id, Key? key}) : super(key: key);

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance.collection(widget.id).get(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                final List<String> paragraphs = snapshot.data!.docs[0]['${widget.id}'].split('\n');

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: paragraphs.map((paragraph) {
                        if (paragraph.startsWith(RegExp(r"^\d+\."))) {
                          // If the paragraph starts with a number and a dot, it's a title.
                          final title = paragraph.replaceAllMapped(
                            RegExp(r"^\d+\.(.*)$"),
                                (match) => match.group(1)?.trim() ?? '',
                          );

                          return Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          );
                        } else {
                          // Otherwise, it's regular text.
                          return Text(
                            paragraph,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          );
                        }
                      }).toList(),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Container(
                    height: 30,
                    width: 60,
                    child: LoadingIndicator(
                        indicatorType: Indicator.ballPulse,

                        /// Required, The loading type of the widget
                        colors: [
                          Colors.brown,
                          Colors.orange,
                          Colors.blueAccent,
                        ],

                        /// Optional, The color collections
                        strokeWidth: 2,

                        /// Optional, The stroke of the line, only applicable to widget which contains line
                        backgroundColor: Colors.transparent,

                        /// Optional, Background of the widget
                        pathBackgroundColor: Colors.black

                        /// Optional, the stroke backgroundColor
                        ),
                  ),
                );
              }
            },
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.id}',
          style: TextStyle(color: Colors.brown),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.brown,
            )),
      ),
    );
  }
}
