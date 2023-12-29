// import 'dart:io';

// import 'package:atulyaras_education_02/Courses/Addcoursecontentafteradddingcourse.dart';
// import 'package:atulyaras_education_02/Utils/utils.dart';
// import 'package:atulyaras_education_02/Widegts/round_button.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class AddFeeds extends StatefulWidget {
//   const AddFeeds({super.key});

//   @override
//   State<AddFeeds> createState() => _AddFeedsState();
// }

// class _AddFeedsState extends State<AddFeeds> {
//   bool loading = false;
//   final coursediscriptioncontroller = TextEditingController();
//   final coursenamecontroller = TextEditingController();
//   final coursepricecontroller = TextEditingController();
//   final courseimglinkcontroller = TextEditingController();

//   final fireStore = FirebaseFirestore.instance.collection('Feeds');
//   File? _image;
//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;
//   final picker = ImagePicker();
//     Future<void> getimageGallery() async {
//     final pickedfile = await picker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 50,
//     );
//     setState(() {
//       if (pickedfile != null) {
//         _image = File(pickedfile.path);
//       } else {
//         Utils().toastMessage('No image picked');
//       }
//     });
//   }
//  Future<void> handleImageUpload() async {
//   if (_image != null) {
//     try {
//       String imageUrl = await uploadimage();
//       courseimglinkcontroller.text = imageUrl; // Save the image URL to the controller
//     } catch (e) {
//       Utils().toastMessage('Failed to upload image: $e');
//     }
//   } else {
//     Utils().toastMessage('No image selected');
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Feeds Data'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               TextFormField(
//                 controller: coursenamecontroller,
//                 maxLines: 1,
//                 decoration: InputDecoration(
//                     hintText: 'Feed Title', border: OutlineInputBorder()),
//               ),
//               TextFormField(
//                 controller: coursediscriptioncontroller,
//                 maxLines: 4,
//                 decoration: InputDecoration(
//                     hintText: 'Add The Feed Discription',
//                     border: OutlineInputBorder()),
//               ),
//               // TextFormField(
//               //   controller: coursepricecontroller,
//               //   maxLines: 1,
//               //   decoration: InputDecoration(
//               //       hintText: 'Course Price', border: OutlineInputBorder()),
//               // ),
//               // TextFormField(
//               //   controller: courseimglinkcontroller,
//               //   maxLines: 4,
//               //   decoration: InputDecoration(
//               //       hintText: 'Course Banner Img Link',
//               //       icon: InkWell(
//               //         child: Icon(Icons.add_a_photo),
//               //         onTap: () async{
//               //           await getimageGallery();
//               //          await handleImageUpload(); 
 
//               //         },
//               //       ),
//               //       border: OutlineInputBorder()),
//               // ),
//               SizedBox(
//                 height: 30,
//               ),
//               RoundButton(
//                 loading: loading,
//                 title: 'Next',
//                 onTap: () {
//                   setState(() {
//                     loading = true;
//                   });

//                   String id = coursenamecontroller.text.toString();
//                     DateTime now = DateTime.now();
//     String formattedDate = "${now.day}-${now.month}-${now.year}";
//     String formattedTime = "${now.hour}:${now.minute}";
//                   //String id = 'ayushshahi96kmr@gmail.com';
//                   fireStore.doc(id).set({
//                     'Feed Title': coursenamecontroller.text.toString(),
//                     'Feed Discription':
//                         coursediscriptioncontroller.text.toString(),
//                     'Upload Date': formattedDate,
//                     'Upload Time':formattedTime,
//                    // 'Course Img Link': courseimglinkcontroller.text.toString()
//                   }).then(
//                     (value) {
//                       Utils().toastMessage(
//                           'Feed Created Successfully');
//                       setState(() {
//                         loading = false;
//                       });
                      
//                     },
//                   ).onError(
//                     (error, stackTrace) {
//                       Utils().toastMessage(error.toString());
//                       setState(() {
//                         loading = false;
//                       });
//                     },
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Future<String> uploadimage() async {
//   if (_image == null) {
//     throw Exception('No image file selected');
//   }
//   String fileExtension = _image!.path.split('.').last;
//   String fileName = '${DateTime.now().microsecondsSinceEpoch}.$fileExtension';
//   firebase_storage.Reference ref = storage.ref('/foldername/$fileName');
//   firebase_storage.SettableMetadata metadata = firebase_storage.SettableMetadata(
//     contentType: 'image/$fileExtension',
//     contentDisposition: 'inline; filename="$fileName"',
//   );
//   firebase_storage.UploadTask uploadTask = ref.putFile(_image!, metadata);
//   await uploadTask;
//   String downloadURL = await ref.getDownloadURL();
//   return downloadURL;
// }
// }
