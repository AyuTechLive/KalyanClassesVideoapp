import 'package:flutter/material.dart';

class LectureCardView extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imglink;
  final VoidCallback ontap;
  const LectureCardView(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imglink,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width * 0.95,
        height: height * 0.125,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            const BoxShadow(
              color: Color.fromARGB(255, 226, 220, 253),
              blurRadius: 2,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Container(
          width: width * 0.95,
          height: height * 0.125,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.03, height * 0.01, 0, height * 0.01),
                child: Stack(children: [
                  Container(
                      height: height * 0.10,
                      width: width * 0.35,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imglink, //'https://blog.mmumullana.org/wp-content/uploads/2018/03/Course-wise-FB-Banners-Feb-2018-1-1.jpg'
                          fit: BoxFit.fill,
                        ),
                      )),
                  Positioned(
                    child: Image.asset(
                      'assets/icons/play.png',
                      height: height * 0.03125,
                      width: width * 0.0694,
                    ),
                    right: width * 0.03,
                    bottom: height * 0.0105,
                  )
                ]),
              ),
              // SizedBox(
              //   width: width * 0.03,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.04, height * 0.02,
                        width * 0.005, height * 0.01),
                    child: SizedBox(
                      width: width * 0.48,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                            softWrap: true,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Divider(
                                thickness: 2,
                              ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                Text(
                                  '$subtitle mins',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ]),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Flexible(
                  child: Image.asset(
                'assets/icons/nextbutton.png',
              )),
            ],
          ),
        ),
      ),
    );
  }
}
