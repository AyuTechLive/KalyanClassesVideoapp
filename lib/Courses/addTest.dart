
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kalyan_education_video_app/Courses/Allcourses.dart';
import 'package:kalyan_education_video_app/Utils/utils.dart';
import 'package:kalyan_education_video_app/Widegts/round_button.dart';

class AddTest extends StatefulWidget {
  final String coursename;
  const AddTest({super.key, required this.coursename});

  @override
  State<AddTest> createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
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
    String action = 'Test Series';
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
                    hintText: 'Test name', border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: videotitlecontroller,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter Your Test Title',
                    border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: videosubtitlecontroller,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter Your  Test Subtitle',
                    border: OutlineInputBorder()),
              ),
              TextFormField(
                controller: videourlcontroller,
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Enter Your Test url',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              RoundButton(
                loading: loading,
                title: 'Add Test',
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
                    'Test Link': videourlcontroller.text.toString()
                  }).then(
                    (value) {
                      Utils().toastMessage('Post Succesfully Added');
                      setState(() {
                        loading = false;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllCoursesScreen(),
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
