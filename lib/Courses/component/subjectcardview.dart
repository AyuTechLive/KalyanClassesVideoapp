import 'package:flutter/material.dart';

class SubjectCardView extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imglink;
  final VoidCallback ontap;
  const SubjectCardView({super.key, required this.title, required this.subtitle, required this.imglink, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width * 0.91,
        height: height * 0.1125,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
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
        child: Container(
          width: width * 0.91,
          height: height * 0.13,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
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
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.03, height * 0.01, 0, height * 0.01),
                child: Container(
                    height: height * 0.13,
                    width: width * 0.25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imglink, //'https://blog.mmumullana.org/wp-content/uploads/2018/03/Course-wise-FB-Banners-Feb-2018-1-1.jpg'
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
              // SizedBox(
              //   width: width * 0.03,
              // ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.01, 0),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Padding(
              //         padding:
              //             EdgeInsets.fromLTRB(width * 0.06, 0, width * 0.05, 0),
              //         child: Text(
              //           title,
              //           style:
              //               TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              //           softWrap: true,
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.fromLTRB(
              //             width * 0.06, height * 0.01, width * 0.05, 0),
              //         child: Text(
              //           subtitle,
              //           style:
              //               TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              //           softWrap: true,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            softWrap: true,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Divider(
                                thickness: 2,
                              ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                
                                // SizedBox(
                                //   width: width * 0.01,
                                // ),
                                Text(
                                  subtitle,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
              
               Flexible(child: Image.asset('assets/icons/nextbutton.png',)),
            ],
          ),
        ),
      ),
    );
  }
}
