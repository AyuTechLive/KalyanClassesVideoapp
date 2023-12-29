
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HomeScreen extends StatefulWidget {
//   final Key? key;

//   HomeScreen({this.key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final searchfiltercontroller = TextEditingController();
//   final auth = FirebaseAuth.instance;
//   bool loading = false;
//   final fireStore =
//       FirebaseFirestore.instance.collection('All Courses').limit(5).snapshots();

//   int _currentIndex = 0;
//   final CarouselController _controller = CarouselController();

//   final List<String> imgList = [
//     'https://www.pw.live/files/repository001/cta/1699621916-880x440%20%281%29.jpg',
//     'https://firebasestorage.googleapis.com/v0/b/atulya-ras-app-02.appspot.com/o/foldername%2F1703444616530692.jpg?alt=media&token=37255064-0304-4981-a3ae-b4a514bde19a',
//     'https://d33g7sdvsfd029.cloudfront.net/paid_course3/2022-12-10-0.5748665012691994.jpg',
//     'https://i.ytimg.com/vi/Ylxrd9T69fU/maxresdefault.jpg'
//     // Add more image URLs
//   ];

//   List<Widget> _buildCarouselDots() {
//     return List<Widget>.generate(imgList.length, (index) {
//       return Container(
//         width: _currentIndex == index ? 10.0 : 8.0,
//         height: _currentIndex == index ? 10.0 : 8.0,
//         margin: EdgeInsets.symmetric(horizontal: 4.0),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: _currentIndex == index
//               ? Color(0xFF7455F7) // Active dot color
//               : Colors.grey, // Inactive dot color
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size screensize = MediaQuery.of(context).size;
//     final double height = screensize.height;
//     final double width = screensize.width;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: height * 0.01),
//               child: Column(
//                 children: <Widget>[
//                   CarouselSlider(
//                     carouselController: _controller,
//                     options: CarouselOptions(
//                       autoPlay: true,
//                       enlargeCenterPage: true,
//                       viewportFraction: 0.9,
//                       aspectRatio: 2.0,
//                       initialPage: 2,
//                       onPageChanged: (index, reason) {
//                         setState(() {
//                           _currentIndex = index;
//                         });
//                       },
//                     ),
//                     items: imgList.map((item) {
//                       return Container(
//                         height: 10,
//                         width: 500,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Image.network(
//                             item,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: _buildCarouselDots(),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: height * 0.02,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'What Are You Looking For ?',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontFamily: 'Lato',
//                     fontWeight: FontWeight.w700,
//                     height: 0,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: height * 0.03,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Spacer(),
//                 HomeScreenCard(
//                   ontap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => NewSubjectList(
//                               coursename: 'Free Course',
//                               courseimglink:
//                                   'https://img.freepik.com/free-psd/e-learning-banner-template-design_23-2149585649.jpg'),
//                         ));
//                   },
//                   title: 'Free Notes',
//                   img: 'notesfree',
//                 ),
//                 Spacer(),
//                 HomeScreenCard(
//                   ontap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => NewSubjectList(
//                               coursename: 'Free Course',
//                               courseimglink:
//                                   'https://img.freepik.com/free-psd/e-learning-banner-template-design_23-2149585649.jpg'),
//                         ));
//                   },
//                   title: 'Free Lectures',
//                   img: 'freevideos',
//                 ),
//                 Spacer(),
//               ],
//             ),
//             SizedBox(
//               height: height * 0.02,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Spacer(),
//                 HomeScreenCard(
//                   ontap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => NewSubjectList(
//                               coursename: 'Free Course',
//                               courseimglink:
//                                   'https://img.freepik.com/free-psd/e-learning-banner-template-design_23-2149585649.jpg'),
//                         ));
//                   },
//                   title: 'Free Test',
//                   img: 'testseries',
//                 ),
//                 Spacer(),
//                 HomeScreenCard(
//                   ontap: () {
//                     _launchURL('http://wa.me/+917800119990');
//                   },
//                   title: 'Doubts',
//                   img: 'doubts',
//                 ),
//                 Spacer(),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                   left: width * 0.04,
//                   top: height * 0.02,
//                   bottom: height * 0.01,
//                   right: width * 0.01),
//               child: Row(
//                 children: [
//                   Text(
//                     'Featured Courses',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontFamily: 'Lato',
//                       fontWeight: FontWeight.w800,
//                       height: 0,
//                     ),
//                   ),
//                   Spacer(),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(context, MaterialPageRoute(
//                           builder: (context) {
//                             return MainPage(
//                               index: 1,
//                             );
//                           },
//                         ));
//                       },
//                       child: Text(
//                         'See All →',
//                         style: TextStyle(
//                           color: Color(0xFF7455F7),
//                           fontSize: 16,
//                           fontFamily: 'Lato',
//                           fontWeight: FontWeight.w800,
//                           height: 0,
//                         ),
//                       ))
//                 ],
//               ),
//             ),
//             StreamBuilder<QuerySnapshot>(
//               stream: fireStore,
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting)
//                   return CircularProgressIndicator();
//                 if (snapshot.hasError) return Text('Some Error');
//                 return SizedBox(
//                   height: height * 0.55,
//                   child: Padding(
//                     padding:
//                         EdgeInsets.fromLTRB(width * 0.01, 0, width * 0.06, 0),
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         // separatorBuilder: (context, index) {
//                         //   return SizedBox(
//                         //     height: height * 0.0125,
//                         //   );
//                         // },
//                         itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, index) {
//                           final coursename = snapshot
//                               .data!.docs[index]['Course Name']
//                               .toString();
//                           if (searchfiltercontroller.text.isEmpty) {
//                             return Padding(
//                               padding: EdgeInsets.only(bottom: height * 0.02),
//                               child: Coursecardview(
//                                 loading: loading,
//                                 courseName: snapshot
//                                     .data!.docs[index]['Course Name']
//                                     .toString(),
//                                 coursePrice: snapshot
//                                     .data!.docs[index]['Course Price']
//                                     .toString(),
//                                 courseImgLink: snapshot
//                                     .data!.docs[index]['Course Img Link']
//                                     .toString(),
//                                 courseDiscription: snapshot
//                                     .data!.docs[index]['Course Discription']
//                                     .toString(),
//                                 ontap: () {
//                                   setState(() {
//                                     loading = true;
//                                   });

//                                   searchAndCreateCourse1(
//                                     snapshot.data!.docs[index]['Course Name']
//                                         .toString(),
//                                     snapshot.data!.docs[index]['Course Price']
//                                         .toString(),
//                                     snapshot
//                                         .data!.docs[index]['Course Img Link']
//                                         .toString(),
//                                     snapshot
//                                         .data!.docs[index]['Course Discription']
//                                         .toString(),
//                                   ).then(
//                                     (value) {
//                                       setState(() {
//                                         loading = false;
//                                       });
//                                     },
//                                   ).onError(
//                                     (error, stackTrace) {
//                                       setState(() {
//                                         loading = false;
//                                       });
//                                     },
//                                   );
//                                 },
//                               ),
//                             );
//                           } else if (coursename
//                               .toLowerCase()
//                               .toString()
//                               .contains(searchfiltercontroller.text
//                                   .toLowerCase()
//                                   .toString())) {
//                             return Coursecardview(
//                               loading: loading,
//                               courseName: snapshot
//                                   .data!.docs[index]['Course Name']
//                                   .toString(),
//                               coursePrice: snapshot
//                                   .data!.docs[index]['Course Price']
//                                   .toString(),
//                               courseImgLink: snapshot
//                                   .data!.docs[index]['Course Img Link']
//                                   .toString(),
//                               courseDiscription: snapshot
//                                   .data!.docs[index]['Course Discription']
//                                   .toString(),
//                               ontap: () {
//                                 setState(() {
//                                   loading = true;
//                                 });

//                                 searchAndCreateCourse1(
//                                   snapshot.data!.docs[index]['Course Name']
//                                       .toString(),
//                                   snapshot.data!.docs[index]['Course Price']
//                                       .toString(),
//                                   snapshot.data!.docs[index]['Course Img Link']
//                                       .toString(),
//                                   snapshot
//                                       .data!.docs[index]['Course Discription']
//                                       .toString(),
//                                 ).then(
//                                   (value) {
//                                     setState(() {
//                                       loading = false;
//                                     });
//                                   },
//                                 ).onError(
//                                   (error, stackTrace) {
//                                     setState(() {
//                                       loading = false;
//                                     });
//                                   },
//                                 );
//                               },
//                             );
//                           } else {
//                             return Container();
//                           }
//                         }),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _launchURL(String urlString) async {
//     final Uri url = Uri.parse(urlString);
//     if (!await launchUrl(url)) {
//       throw 'Could not launch $urlString';
//     }
//   }

//   Future<void> searchAndCreateCourse1(String coursename, String courseprice,
//       String courseimg, String coursediscription) async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     String usersCollectionPath = 'Users'; // The collection name
//     String userEmailsDocumentId = auth.currentUser!.email ??
//         auth.currentUser!.phoneNumber!; // The document name

//     String courseFieldKey =
//         coursename; // The field key for the course data within the emails document

//     // Reference to the emails document in the users collection
//     DocumentReference emailsDocumentRef =
//         firestore.collection(usersCollectionPath).doc(userEmailsDocumentId);

//     // Get the current snapshot of the emails document
//     DocumentSnapshot emailsSnapshot = await emailsDocumentRef.get();

//     Map<String, dynamic> emailsData =
//         emailsSnapshot.data() as Map<String, dynamic>;

//     // Check if the courseFieldKey already exists and is a list
//     if (emailsData.containsKey(courseFieldKey) &&
//         emailsData[courseFieldKey] is List) {
//       // CourseFieldKey exists and is a list, print its values
//       List<dynamic> courseList = emailsData[courseFieldKey];
//       if (courseList[0] == 0) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CourseDetails(
//                   coursename: coursename,
//                   courseprice: courseprice,
//                   courseImage: courseimg,
//                   coursediscription: coursediscription),
//             ));
//       } // commented for while testing
//       if (courseList[0] == 2) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => NewSubjectList(
//                   coursename: coursename, courseimglink: courseimg),
//             )); // commeted till Newsubject list not created//
//       }
//     } else {
//       // CourseFieldKey does not exist as a list, add it as an empty list
//       await emailsDocumentRef.set(
//           {
//             courseFieldKey: [0],

//             // Initialize with a list containing the value 0
//           },
//           SetOptions(
//               merge:
//                   true)); // Using merge to update the document without overwriting other fields
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CourseDetails(
//                 coursename: coursename,
//                 courseprice: courseprice,
//                 courseImage: courseimg,
//                 coursediscription: coursediscription),
//           ));

//       ///////
//     }
//   }
// }
