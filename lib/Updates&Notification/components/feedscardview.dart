import 'package:flutter/material.dart';

class FeedsCardView extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String discroption;
  const FeedsCardView(
      {super.key,
      required this.title,
      required this.date,
      required this.time,
      required this.discroption});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
      child: Container(
        width: width * 0.91,
        //  height: height * 0.44,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.03,
                top: height * 0.02,
              ),
              child: Row(
                children: [
                  Row(children: [
                    Image.asset(
                      'assets/icons/circlelogo.png',
                      scale: 16.5,
                    )
                  ]),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Atulya RAS ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ]),
                      SizedBox(
                        height: height * 0.001,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Posted On $date at $time',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12),
                            ),
                          ]),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width * 0.8,
                      child: Text(
                        discroption,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Color.fromARGB(211, 8, 1, 1)),
                        softWrap: true,
                        maxLines: 30,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
