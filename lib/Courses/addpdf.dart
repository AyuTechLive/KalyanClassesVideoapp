
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kalyan_education_video_app/Courses/addTest.dart';
import 'package:kalyan_education_video_app/Utils/utils.dart';
import 'package:kalyan_education_video_app/Widegts/round_button.dart';

class Addpdf extends StatefulWidget {
  final String coursename;
  const Addpdf({super.key, required this.coursename});

  @override
  State<Addpdf> createState() => _AddpdfState();
}

class _AddpdfState extends State<Addpdf> {
  bool loading = false;
  final postcontroller = TextEditingController();
  late TextEditingController cousenamecontroller;
  final subjectcontroller = TextEditingController();
  final videotitlecontroller = TextEditingController();
  final videosubtitlecontroller = TextEditingController();
  final videourlcontroller = TextEditingController();
  final videolectureno = TextEditingController();
  late DatabaseReference databaseRef;

  @override
  void initState() {
    // TODO: implement initState

    databaseRef = FirebaseDatabase.instance.ref(widget.coursename);
    cousenamecontroller = TextEditingController();
    cousenamecontroller.text = widget.coursename;
  }

  @override
  Widget build(BuildContext context) {
    String action = 'Pdfs';
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Your Course Content'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: cousenamecontroller,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter the course name',
                    border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: subjectcontroller,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter Your Subject',
                    border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: videolectureno,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'PDF name', border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: videotitlecontroller,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter Your PdfTitle',
                    border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: videosubtitlecontroller,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter Your PdfSubtitle',
                    border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: videourlcontroller,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter Your Pdf url',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              RoundButton(
                loading: loading,
                title: 'Add PDF',
                onTap: () {
                  setState(() {
                    loading = true;
                  });

                  String id = postcontroller.text.toString();
                  databaseRef
                      .child(id)
                      .child('SUBJECTS')
                      .child(subjectcontroller.text.toString())
                      .child(action) // inreplacement of videos action is used
                      .child(videolectureno.text.toString())
                      .set({
                    'id': videolectureno.text.toString(),
                    'Title': videotitlecontroller.text.toString(),
                    'Subtitle': videosubtitlecontroller.text.toString(),
                    'Pdf Link': videourlcontroller.text.toString()
                  }).then(
                    (value) {
                      Utils().toastMessage('Post Succesfully Added');
                      setState(() {
                        loading = false;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddTest(coursename: widget.coursename),
                            ));
                      });
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
