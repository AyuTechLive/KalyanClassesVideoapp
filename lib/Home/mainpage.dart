// import 'dart:io';
// import 'package:atulyaras_education_02/Auth/login_screen.dart';
// import 'package:atulyaras_education_02/Courses/Allcourses.dart';
// import 'package:atulyaras_education_02/Courses/subjectlist.dart';
// import 'package:atulyaras_education_02/Home/Profile.dart';
// import 'package:atulyaras_education_02/Home/components/sidemenucard.dart';
// import 'package:atulyaras_education_02/Home/components/sidemenuitems.dart';
// import 'package:atulyaras_education_02/Home/homescreen.dart';
// import 'package:atulyaras_education_02/Updates&Notification/updates.dart';
// import 'package:atulyaras_education_02/Utils/utils.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:atulyaras_education_02/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class MainPage extends StatefulWidget {
//   final int index;
//   const MainPage({super.key, this.index = 0});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   final auth = FirebaseAuth.instance;
//   @override
//   void initState() {
//     super.initState();
//     if (widget.index == 1) {
//       setState(() {
//         currentindex = 1;
//       });
//     }
//   }

//   int currentindex = 0;
//   DateTime? currentBackPressTime;
//   @override
//   Widget build(BuildContext context) {
//     List<SideMenuItem> sideMenuItems = [
//       SideMenuItem(
//         title: 'Offline Downloads',
//         iconPath: 'filedownload',
//         onTap: () {
//           Utils().toastMessage('Feature Under Development');
//           // Define the action for Item 1 onTap
//           // e.g., Navigator.push(...), setState(...), etc.
//         },
//       ),
//       SideMenuItem(
//         title: 'Free Materials',
//         iconPath: 'folder-open 1',
//         onTap: () {
//           // Define the
//           //action for Item 2 onTap
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => NewSubjectList(
//                     coursename: 'Free Course',
//                     courseimglink:
//                         'https://img.freepik.com/free-psd/e-learning-banner-template-design_23-2149585649.jpg'),
//               ));
//         },
//       ),
//       SideMenuItem(
//         title: 'Share',
//         iconPath: 'share',
//         onTap: () {
//           onShare(context);
//           // Define the action for Item 2 onTap
//         },
//       ),
//       SideMenuItem(
//         title: 'Youtube',
//         iconPath: 'youtube',
//         onTap: () {
//           _launchURL('https://www.youtube.com/@ATULYARASONLINE');
//           // Define the action for Item 2 onTap
//         },
//       ),
//       SideMenuItem(
//         title: 'Facebook',
//         iconPath: 'facebook',
//         onTap: () {
//           _launchURL('https://www.facebook.com/atulyaRAS/');
//           // Define the action for Item 2 onTap
//         },
//       ),
//       SideMenuItem(
//         title: 'Refer and Earn',
//         iconPath: 'referandearn',
//         onTap: () {
//           Utils().toastMessage('Feature Under Development');
//           // Define the action for Item 2 onTap
//         },
//       ),
//       // Add more SideMenuItem objects for additional items
//     ];
//     final Size screensize = MediaQuery.of(context).size;
//     final double height = screensize.height;
//     final double width = screensize.width;
//     return WillPopScope(
//       onWillPop: () async {
//         if (currentindex != 0) {
//           setState(() {
//             currentindex = 0;
//           });
//           return false;
//         } else {
//           if (currentBackPressTime == null ||
//               DateTime.now().difference(currentBackPressTime!) >
//                   Duration(seconds: 2)) {
//             currentBackPressTime = DateTime.now();
//             Utils().toastMessage('Press Back Again to exit');
//             return false;
//           }
//           exit(0);
//         }
//       },
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text('Atulya RAS'),
//             backgroundColor: Color(0xff7455F7),
//             automaticallyImplyLeading: false,
//             leading: Builder(
//               builder: (BuildContext context) {
//                 return IconButton(
//                   icon: Icon(Icons.menu),
//                   onPressed: () {
//                     Scaffold.of(context).openDrawer(); // Opens the drawer
//                   },
//                 );
//               },
//             ),
//           ),
//           drawer: Drawer(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: height * 0.06),
//                 Padding(
//                   padding: EdgeInsets.only(left: width * 0.05),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: width * 0.277,
//                         height: height * 0.125,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color(0x3F000000),
//                               blurRadius: 3,
//                               offset: Offset(0, 4),
//                               spreadRadius: 0,
//                             )
//                           ],
//                         ),
//                         child: Image.asset(
//                           'assets/icons/account.png',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: EdgeInsets.only(left: width * 0.1),
//                   child: Text(
//                     auth.currentUser!.email ?? auth.currentUser!.phoneNumber!,
//                     style: TextStyle(
//                       color: Color(0xFF565656),
//                       fontSize: 20,
//                       fontFamily: 'Lato',
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: height * 0.03875),
//                 Expanded(
//                   child: Row(children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: width * 0.0388),
//                       child: Container(
//                         width: 4,
//                         color: Color(0xFFE68969),
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                             left: width * 0.036, right: width * 0.075),
//                         child: ListView.separated(
//                           padding: EdgeInsets.zero,
//                           itemBuilder: (context, index) {
//                             return SideMenuCrad(
//                               title: sideMenuItems[index].title,
//                               iconname: sideMenuItems[index].iconPath,
//                               ontap: sideMenuItems[index].onTap,
//                             );
//                           },
//                           separatorBuilder: (context, index) {
//                             return SizedBox(height: height * 0.025);
//                           },
//                           itemCount: 6,
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(bottom: height * 0.05),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             auth.signOut().then(
//                               (value) {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => LoginScreen(),
//                                     ));
//                               },
//                             );
//                           },
//                           child: Container(
//                             width: width * 0.5277,
//                             height: height * 0.05875,
//                             decoration: ShapeDecoration(
//                               color: Color(0xFF7455F7),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               shadows: [
//                                 BoxShadow(
//                                   color: Color(0x3F000000),
//                                   blurRadius: 4,
//                                   offset: Offset(0, 4),
//                                   spreadRadius: 0,
//                                 )
//                               ],
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 // Image.asset('assets/icons/share.png'),

//                                 Text(
//                                   'Sign Out ',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w700,
//                                     height: 0,
//                                     letterSpacing: 0.65,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ]),
//                 )
//               ],
//             ),
//           ),
//           body: pages[currentindex],
//           bottomNavigationBar: BottomNavigationBar(
//             items: [
//               BottomNavigationBarItem(
//                 icon: currentindex == 0
//                     ? Image.asset(
//                         'assets/icons/home1.png',
//                         color: Color(0xFF7455F7),
//                       )
//                     : Image.asset('assets/icons/home1.png'),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                   icon: currentindex == 1
//                       ? Image.asset(
//                           'assets/icons/courses.png',
//                           color: Color(0xFF7455F7),
//                         )
//                       : Image.asset(
//                           'assets/icons/courses.png',
//                         ),
//                   label: 'Courses'),
//               BottomNavigationBarItem(
//                   icon: currentindex == 2
//                       ? Image.asset(
//                           'assets/icons/content.png',
//                           color: Color(0xFF7455F7),
//                         )
//                       : Image.asset('assets/icons/content.png'),
//                   label: 'Feeds'),
//               BottomNavigationBarItem(
//                   icon: currentindex == 3
//                       ? Image.asset(
//                           'assets/icons/profile.png',
//                           color: Color(0xFF7455F7),
//                         )
//                       : Image.asset('assets/icons/profile.png'),
//                   label: 'Profile'),
//               // BottomNavigationBarItem(
//               //     icon: Image.asset('assets/icons/'),
//               //     label: 'Favorite'),
//             ],
//             onTap: (index) {
//               print(index);
//               setState(() {
//                 currentindex = index;
//               });
//             },
//             currentIndex: currentindex,
//             type: BottomNavigationBarType.fixed,
//             // showSelectedLabels: false,
//             // showUnselectedLabels: false,
//             backgroundColor: Colors.white,
//             selectedItemColor: Color(0xFF7455F7),
//             selectedIconTheme: IconThemeData(color: Color(0xFF7455F7)),
//             selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//           )),
//     );
//   }

//   final pages = [
//     //  HomePage(),
//     HomeScreen(),
//     AllCoursesScreen(),
//     UpdatesScreen(),
//     Profile(),
//     //  Profile(),
//   ];
//   Future<void> _launchURL(String urlString) async {
//     final Uri url = Uri.parse(urlString);
//     if (!await launchUrl(url)) {
//       throw 'Could not launch $urlString';
//     }
//   }
// }

// void onShare(BuildContext context) async {
//   final String textToShare = "This is some default text that I want to share.";
//   await Share.share(textToShare, subject: 'Sharing via Atulya RAS');
// }
