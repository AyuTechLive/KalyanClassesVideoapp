import 'package:flutter/material.dart';

class Coursecardview extends StatelessWidget {
  final String courseName;
  final String courseDiscription;
  final VoidCallback ontap;
  final String courseImgLink;
  final String coursePrice;
  final bool loading;
  const Coursecardview(
      {super.key,
      required this.courseName,
      required this.courseDiscription,
      required this.ontap,
      required this.courseImgLink,
      required this.coursePrice,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;

    // return Padding(
    //   padding: EdgeInsets.fromLTRB(width*0.03, height*0.01, 0, 0),
    //   child: Container(
    //     width: width*0.91,
    //     height: height*0.13,
    //     decoration: ShapeDecoration(
    //       color: Colors.white,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20),
    //       ),
    //       shadows: [
    //         BoxShadow(
    //           color: Color(0x3F000000),
    //           blurRadius: 4,
    //           offset: Offset(0, 4),
    //           spreadRadius: 0,
    //         )
    //       ],
    //     ),
    //     child: Row(
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.fromLTRB(width*0.03, height*0.01,0, height*0.01),
    //           child: Container(
    //             height: height*0.100,
    //             width: width*0.3,
    //             child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(10),
    //                       child: Image.network(
    //                         'https://blog.mmumullana.org/wp-content/uploads/2018/03/Course-wise-FB-Banners-Feb-2018-1-1.jpg',
    //                         fit: BoxFit.fill,
    //                       ),
    //                     )
    //           ),
    //         ),
    //         SizedBox(width: width*0.03,),

    //         Padding(
    //           padding: EdgeInsets.fromLTRB(width*0.03,height*0.01,width*0.01,0),
    //           child: Column(
    //            // mainAxisAlignment: MainAxisAlignment.center,
    //           // crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Text(
    //               'RAS mains TANDAV ',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   color: Colors.black,
    //                   fontSize: 16,
    //                   fontFamily: 'Lato',
    //                   fontWeight: FontWeight.w800,
    //                   height: 0,
    //               ),
    //               softWrap: true,
    //               overflow: TextOverflow.clip,
    //               maxLines: 2,
    //             ),
    //             Text(
    //               '\$1.2',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   color: Color(0xFF565656),
    //                   fontSize: 15,
    //                   fontFamily: 'Lato',
    //                   fontWeight: FontWeight.w800,
    //                   height: 0,
    //               ),
    //             )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    //  );
    return Padding(
      padding:
          EdgeInsets.fromLTRB(width * 0.063, height * 0.0125, width * 0.022, 0),
      child: Container(
        width: width * 0.91,
        // height: height*0.44,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 3),
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
                height: height * 0.22,
                width: width * 0.91,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    courseImgLink,
                    scale: 1.0,
                    fit: BoxFit.fill,
                  ),
                )),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.06, height * 0.01, width * 0.05, 0),
              child: Text(
                courseName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, height * 0.02, 0, height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.06,
                  ),
                  InkWell(
                    onTap: ontap,
                    child: Container(
                      // margin: EdgeInsets.all(15),
                      width: width * 0.6,
                      height: height * 0.06,
                      decoration: ShapeDecoration(
                        color: Color(0xff7455F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        shadows: [
                          const BoxShadow(
                            color: Color.fromARGB(62, 255, 251, 251),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Center(
                        child: loading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              )
                            : Text(
                                'Explore',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
