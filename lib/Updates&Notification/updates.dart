// import 'package:atulyaras_education_02/Auth/login_screen.dart';
// import 'package:atulyaras_education_02/Courses/Addcourse.dart';
// import 'package:atulyaras_education_02/Courses/component/newcoursecardview.dart';
// import 'package:atulyaras_education_02/Courses/coursediscription.dart';
// import 'package:atulyaras_education_02/Courses/subjectlist.dart';
// import 'package:atulyaras_education_02/Updates&Notification/addfeeds.dart';
// import 'package:atulyaras_education_02/Updates&Notification/components/feedscardview.dart';
// import 'package:atulyaras_education_02/Utils/utils.dart';
// import 'package:atulyaras_education_02/Widegts/appbar.dart';
// import 'package:atulyaras_education_02/Widegts/searchbar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';

// class UpdatesScreen extends StatefulWidget {
//   const UpdatesScreen({super.key});

//   @override
//   State<UpdatesScreen> createState() => _UpdatesScreenState();
// }

// class _UpdatesScreenState extends State<UpdatesScreen> {
//   final searchfiltercontroller = TextEditingController();
//   final auth = FirebaseAuth.instance;
//   final fireStore =
//       FirebaseFirestore.instance.collection('Feeds').snapshots();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
//       SystemUiOverlay.top,
//       SystemUiOverlay.bottom,
//     ]);
//     final Size screensize = MediaQuery.of(context).size;
//     final double height = screensize.height;
//     final double width = screensize.width;
//     return Scaffold(
   
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     Navigator.push(
//       //         context,
//       //         MaterialPageRoute(
//       //           builder: (context) => AddFeeds(),
//       //         ));
//       //   },
//       //   child: Icon(Icons.add),
//       // ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: height * 0.035,
//           ),
         
//           //  SearchBarCustom(searcheditingcontroller1: searchfiltercontroller,),
         
//           StreamBuilder<QuerySnapshot>(
//             stream: fireStore,
//             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting)
//                 return CircularProgressIndicator();
//               if (snapshot.hasError) return Text('Some Error');
//               return Expanded(
//                   child: Padding(
//                 padding: EdgeInsets.fromLTRB(width * 0.04, 0, width * 0.04, 0),
//                 child: ListView.separated(
                 
//                     separatorBuilder: (context, index) {
//                       return SizedBox(
//                         height: height * 0.0111,
//                       );
//                     },
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context, index) {
//                           return Padding(
//                           padding: EdgeInsets.only(bottom: height * 0.02),
//                           child: FeedsCardView(
//                             title: snapshot
//                                 .data!.docs[index]['Feed Title']
//                                 .toString(),
//                             discroption: snapshot
//                                 .data!.docs[index]['Feed Discription']
//                                 .toString(),
//                             date: snapshot
//                                 .data!.docs[index]['Upload Date']
//                                 .toString(),
//                             time: snapshot
//                                 .data!.docs[index]['Upload Time']
//                                 .toString(),
                            
//                           )
//                           );
//                     }),
//               ));
//             },
//           ),
//         ],
//       ),
//     );
//   }

  
// }
