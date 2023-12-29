// import 'package:atulyaras_education_02/Auth/login_screen.dart';
// import 'package:atulyaras_education_02/Home/components/profiledetailscard.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   final auth = FirebaseAuth.instance; // Initialize FirebaseAuth instance
//   final fireStore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     final Size screensize = MediaQuery.of(context).size;
//     final double height = screensize.height;
//     final double width = screensize.width;
//     // Initialize FirebaseFirestore instance
//     return Scaffold(
//       body: Column(children: [
//         SizedBox(
//           height: height * 0.3,
//           child: Stack(
//             children: [
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 child: Container(
//                   width: width,
//                   height: height * 0.1975,
//                   decoration: BoxDecoration(color: Color(0xFF7455F7)),
//                 ),
//               ),
//               Positioned(
//                 top: height * 0.125, // Adjust the top position as needed
//                 left: width * 0.05, // Adjust the left position as needed
//                 child: Container(
//                   width: width * 0.277,
//                   height: height * 0.125,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Color(0x3F000000),
//                         blurRadius: 3,
//                         offset: Offset(0, 4),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),
//                   child: Image.asset(
//                     'assets/icons/account.png',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         FutureBuilder<String?>(
//           future: getUIDFromFirestore('Name'),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator(); // Show a loading spinner while waiting for data
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (snapshot.hasData) {
//               return ProfileCardDetails(
//                 title: 'Name',
//                 subtitle: snapshot.data ?? 'Not available',
//                 icon:
//                     'name', // Make sure you have an appropriate icon for 'uid'
//               );
//             } else {
//               return Text('UID not found');
//             }
//           },
//         ),
//         Divider(
//           thickness: 1,
//         ),
//         ProfileCardDetails(
//           title: 'Email',
//           subtitle: auth.currentUser!.email ??
//         auth.currentUser!.phoneNumber!,
//           icon: 'email',
//         ),
//         Divider(
//           thickness: 1,
//         ),
//         FutureBuilder<String?>(
//           future: getUIDFromFirestore('UID'),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator(); // Show a loading spinner while waiting for data
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (snapshot.hasData) {
//               return ProfileCardDetails(
//                 title: 'Roll No',
//                 subtitle: snapshot.data ?? 'Not available',
//                 icon:
//                     'rollno', // Make sure you have an appropriate icon for 'uid'
//               );
//             } else {
//               return Text('UID not found');
//             }
//           },
//         ),
//         Divider(
//           thickness: 1,
//         ),
//         FutureBuilder<String?>(
//           future: getUIDFromFirestore('DOJ'),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator(); // Show a loading spinner while waiting for data
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (snapshot.hasData) {
//               return ProfileCardDetails(
//                 title: 'Date Of Joining',
//                 subtitle: snapshot.data ?? 'Not available',
//                 icon:
//                     'date', // Make sure you have an appropriate icon for 'uid'
//               );
//             } else {
//               return Text('UID not found');
//             }
//           },
//         ),
//         SizedBox(
//           height: height * 0.1,
//         ),
//         InkWell(
//           onTap: () {
//             auth.signOut().then(
//               (value) {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => LoginScreen(),
//                     ));
//               },
//             );
//           },
//           child: Container(
//             alignment: Alignment.center,
//             width: width * 0.522,
//             height: height * 0.070,
//             decoration: ShapeDecoration(
//               color: Color(0xFF7455F7),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               shadows: [
//                 BoxShadow(
//                   color: Color(0x3F000000),
//                   blurRadius: 4,
//                   offset: Offset(0, 4),
//                   spreadRadius: 0,
//                 )
//               ],
//             ),
//             child: Text(
//               'Sign out',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontFamily: 'Lato',
//                 fontWeight: FontWeight.w900,
//                 height: 0,
//                 letterSpacing: 1.20,
//               ),
//             ),
//           ),
//         )
//       ]),
//     );
//   }

//   Future<String?> getUIDFromFirestore(String key) async {
//     try {
//       String userEmail = auth.currentUser!.email ??
//           auth.currentUser!.phoneNumber!; // Get the current user's email

//       DocumentSnapshot userDocSnapshot =
//           await fireStore.collection('Users').doc(userEmail).get();

//       if (userDocSnapshot.exists) {
//         // Cast data to Map<String, dynamic>? to resolve the issue
//         Map<String, dynamic>? userData =
//             userDocSnapshot.data() as Map<String, dynamic>?;

//         // Access the 'UID' field from the userData Map
//         return userData?[key]; // Replace 'UID' with your field name
//       }
//     } catch (e) {
//       print('Error occurred while retrieving UID: $e');
//       return null;
//     }
//     return null;
//   }
// }
