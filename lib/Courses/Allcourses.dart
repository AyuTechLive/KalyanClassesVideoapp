import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:kalyan_education_video_app/Auth/login_screen.dart';
import 'package:kalyan_education_video_app/Courses/Addcourse.dart';
import 'package:kalyan_education_video_app/Courses/component/newcoursecardview.dart';
import 'package:kalyan_education_video_app/Courses/coursediscription.dart';
import 'package:kalyan_education_video_app/Courses/subjectlist.dart';
import 'package:kalyan_education_video_app/Home/components/sidemenucard.dart';
import 'package:kalyan_education_video_app/Home/components/sidemenuitems.dart';
import 'package:kalyan_education_video_app/Utils/utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AllCoursesScreen extends StatefulWidget {
  const AllCoursesScreen({super.key});

  @override
  State<AllCoursesScreen> createState() => _AllCoursesScreenState();
}

class _AllCoursesScreenState extends State<AllCoursesScreen> {
  final searchfiltercontroller = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  final fireStore =
      FirebaseFirestore.instance.collection('All Courses').snapshots();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    List<SideMenuItem> sideMenuItems = [
      SideMenuItem(
        title: 'Offline Downloads',
        iconPath: 'filedownload',
        onTap: () {
          Utils().toastMessage('Feature Under Development');
          // Define the action for Item 1 onTap
          // e.g., Navigator.push(...), setState(...), etc.
        },
      ),
      SideMenuItem(
        title: 'Free Materials',
        iconPath: 'folder-open 1',
        onTap: () {
          // Define the
          //action for Item 2 onTap
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewSubjectList(
                    coursename: 'Free Course',
                    courseimglink:
                        'https://img.freepik.com/free-psd/e-learning-banner-template-design_23-2149585649.jpg'),
              ));
        },
      ),
      SideMenuItem(
        title: 'Share',
        iconPath: 'share',
        onTap: () {
          onShare(context);
          // Define the action for Item 2 onTap
        },
      ),
      SideMenuItem(
        title: 'Youtube',
        iconPath: 'youtube',
        onTap: () {
          _launchURL('https://www.youtube.com/@ATULYARASONLINE');
          // Define the action for Item 2 onTap
        },
      ),
      SideMenuItem(
        title: 'Facebook',
        iconPath: 'facebook',
        onTap: () {
          _launchURL('https://www.facebook.com/atulyaRAS/');
          // Define the action for Item 2 onTap
        },
      ),
      SideMenuItem(
        title: 'Refer and Earn',
        iconPath: 'referandearn',
        onTap: () {
          Utils().toastMessage('Feature Under Development');
          // Define the action for Item 2 onTap
        },
      ),
      // Add more SideMenuItem objects for additional items
    ];
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    DateTime? currentBackPressTime;
    int currentindex = 0;
    return WillPopScope(
      onWillPop: () async {
        if (currentindex != 0) {
          setState(() {
            currentindex = 0;
          });
          return false;
        } else {
          if (currentBackPressTime == null ||
              DateTime.now().difference(currentBackPressTime!) >
                  Duration(seconds: 2)) {
            currentBackPressTime = DateTime.now();
            Utils().toastMessage('Press Back Again to exit');
            return false;
          }
          exit(0);
        }
      },
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => AddCourse(),
        //         ));
        //   },
        //   child: Icon(Icons.add),
        // ),
        appBar: AppBar(
          title: Text('Kalyan Classes'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Opens the drawer
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.06),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.277,
                      height: height * 0.125,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 3,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Image.asset(
                        'assets/icons/account.png',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: Text(
                  auth.currentUser!.email ?? auth.currentUser!.phoneNumber!,
                  style: TextStyle(
                    color: Color(0xFF565656),
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03875),
              Expanded(
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.0388),
                    child: Container(
                      width: 4,
                      color: Color(0xFFE68969),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.036, right: width * 0.075),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return SideMenuCrad(
                            title: sideMenuItems[index].title,
                            iconname: sideMenuItems[index].iconPath,
                            ontap: sideMenuItems[index].onTap,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: height * 0.025);
                        },
                        itemCount: 6,
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.05),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                    onTap: () {
                      auth.signOut().then(
                        (value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                      );
                    },
                    child: Container(
                      width: width * 0.5277,
                      height: height * 0.05875,
                      decoration: ShapeDecoration(
                        color: Color(0xFF7455F7),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.asset('assets/icons/share.png'),

                          Text(
                            'Sign Out ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: 0.65,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.035,
            ),
            Container(
              width: width * 0.833,
              height: height * 0.04875,
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
              child: TextFormField(
                textAlign: TextAlign.justify,
                controller: searchfiltercontroller,
                cursorColor: Color(0xff7455F7),
                decoration: InputDecoration(
                    icon: Padding(
                        padding: EdgeInsets.fromLTRB(
                            width * 0.03, height * 0.001, 0, height * 0.001),
                        child: Icon(Icons.search)),
                    hintText: 'Search For The Classes',
                    iconColor: Color(0xff7455F7),
                    border: InputBorder.none),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            //  SearchBarCustom(searcheditingcontroller1: searchfiltercontroller,),
            SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();

                if (snapshot.hasError) return Text('Some Error');
                return Expanded(
                    child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.01, 0, width * 0.06, 0),
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: height * 0.0125,
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final coursename = snapshot
                            .data!.docs[index]['Course Name']
                            .toString();
                        if (searchfiltercontroller.text.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: height * 0.02),
                            child: Coursecardview(
                              loading: loading,
                              courseName: snapshot
                                  .data!.docs[index]['Course Name']
                                  .toString(),
                              coursePrice: snapshot
                                  .data!.docs[index]['Course Price']
                                  .toString(),
                              courseImgLink: snapshot
                                  .data!.docs[index]['Course Img Link']
                                  .toString(),
                              courseDiscription: snapshot
                                  .data!.docs[index]['Course Discription']
                                  .toString(),
                              ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewSubjectList(
                                        coursename: coursename,
                                        courseimglink: snapshot.data!
                                            .docs[index]['Course Img Link']
                                            .toString(),
                                      ),
                                    ));
                              },
                            ),
                          );
                        } else if (coursename.toLowerCase().toString().contains(
                            searchfiltercontroller.text
                                .toLowerCase()
                                .toString())) {
                          return Coursecardview(
                              loading: loading,
                              courseName: snapshot
                                  .data!.docs[index]['Course Name']
                                  .toString(),
                              coursePrice: snapshot
                                  .data!.docs[index]['Course Price']
                                  .toString(),
                              courseImgLink: snapshot
                                  .data!.docs[index]['Course Img Link']
                                  .toString(),
                              courseDiscription: snapshot
                                  .data!.docs[index]['Course Discription']
                                  .toString(),
                              ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewSubjectList(
                                        coursename: coursename,
                                        courseimglink: snapshot.data!
                                            .docs[index]['Course Img Link']
                                            .toString(),
                                      ),
                                    ));
                              });
                        } else {
                          return Container();
                        }
                      }),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw 'Could not launch $urlString';
    }
  }

  void onShare(BuildContext context) async {
    final String textToShare =
        "This is some default text that I want to share.";
    await Share.share(textToShare, subject: 'Sharing via Atulya RAS');
  }
}

  // Future<void> searchAndCreateCourse1(String coursename, String courseprice,
  //     String courseimg, String coursediscription) async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   String usersCollectionPath = 'Users'; // The collection name
  //   String userEmailsDocumentId = auth.currentUser!.email ??
  //       auth.currentUser!.phoneNumber!; // The document name
  //   String courseFieldKey =
  //       coursename; // The field key for the course data within the emails document

  //   // Reference to the emails document in the users collection
  //   DocumentReference emailsDocumentRef =
  //       firestore.collection(usersCollectionPath).doc(userEmailsDocumentId);

  //   // Get the current snapshot of the emails document
  //   DocumentSnapshot emailsSnapshot = await emailsDocumentRef.get();

  //   Map<String, dynamic> emailsData =
  //       emailsSnapshot.data() as Map<String, dynamic>;

  //   // Check if the courseFieldKey already exists and is a list
  //   if (emailsData.containsKey(courseFieldKey) &&
  //       emailsData[courseFieldKey] is List) {
  //     // CourseFieldKey exists and is a list, print its values
  //     List<dynamic> courseList = emailsData[courseFieldKey];
  //     if (courseList[0] == 0) {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => CourseDetails(
  //                 coursename: coursename,
  //                 courseprice: courseprice,
  //                 courseImage: courseimg,
  //                 coursediscription: coursediscription),
  //           ));
  //     } // commented for while testing
  //     if (courseList[0] == 2) {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => NewSubjectList(
  //                 coursename: coursename, courseimglink: courseimg),
  //           )); // commeted till Newsubject list not created//
  //     }
  //   } else {
  //     // CourseFieldKey does not exist as a list, add it as an empty list
  //     await emailsDocumentRef.set(
  //         {
  //           courseFieldKey: [0],

  //           // Initialize with a list containing the value 0
  //         },
  //         SetOptions(
  //             merge:
  //                 true)); // Using merge to update the document without overwriting other fields
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => CourseDetails(
  //               coursename: coursename,
  //               courseprice: courseprice,
  //               courseImage: courseimg,
  //               coursediscription: coursediscription),
  //         ));
  //     ///////
  //   }
  // }

