
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kalyan_education_video_app/Courses/addpdf.dart';
import 'package:kalyan_education_video_app/Utils/utils.dart';
import 'package:kalyan_education_video_app/Widegts/round_button.dart';

class AddCourseContentAfterAddingCourse extends StatefulWidget {
  final String coursename;
  const AddCourseContentAfterAddingCourse(
      {super.key, required this.coursename});

  @override
  State<AddCourseContentAfterAddingCourse> createState() =>
      _AddCourseContentAfterAddingCourseState();
}

class _AddCourseContentAfterAddingCourseState
    extends State<AddCourseContentAfterAddingCourse> {
  bool loading = false;
  final postcontroller = TextEditingController();
  late TextEditingController cousenamecontroller;
  final subjectcontroller = TextEditingController();
  final videotitlecontroller = TextEditingController();
  final videosubtitlecontroller = TextEditingController();
  final videourlcontroller = TextEditingController();
  final videolectureno = TextEditingController();
  late DatabaseReference databaseRef;
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState

    databaseRef = FirebaseDatabase.instance.ref(widget.coursename);
    cousenamecontroller = TextEditingController();
    cousenamecontroller.text = widget.coursename;
  }

  @override
  Widget build(BuildContext context) {
    String action = 'Videos';
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
                    hintText: 'Lecture name', border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: videotitlecontroller,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter Your VideoTitle',
                    border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: videosubtitlecontroller,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter Your VideoSubtitle',
                    border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: videourlcontroller,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter Your videourl',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              RoundButton(
                loading: loading,
                title: 'Add Video Lecture',
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
                    'Video Link': videourlcontroller.text.toString()
                  }).then(
                    (value) {
                      Utils().toastMessage('Post Succesfully Added');
                      setState(() {
                        counter++;
                        loading = false;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Addpdf(coursename:widget.coursename),
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
