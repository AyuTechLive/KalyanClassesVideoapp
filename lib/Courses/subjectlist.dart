import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/services.dart';
import 'package:kalyan_education_video_app/Courses/Addcoursecontentafteradddingcourse.dart';
import 'package:kalyan_education_video_app/Courses/component/subjectcardview.dart';
import 'package:kalyan_education_video_app/Courses/lectureslist.dart';
import 'package:kalyan_education_video_app/Home/components/nodatafound.dart';

class ChildItem {
  final String key;
  final dynamic value;

  ChildItem(this.key, this.value);

  ChildItem.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key!,
        value = snapshot.value;

  // Add any oth
  //initer relevant methods and properties for your data model
}

class NewSubjectList extends StatefulWidget {
  final String coursename;
  final String courseimglink;
  NewSubjectList(
      {super.key, required this.coursename, required this.courseimglink});

  @override
  State<NewSubjectList> createState() => _NewSubjectListState();
}

class _NewSubjectListState extends State<NewSubjectList> {
  final textcontroller = TextEditingController();
  final searchfiltercontroller = TextEditingController();

  late DatabaseReference _databaseReference;

  // .child('Maths')
  Stream<DatabaseEvent> getChildrenStream() {
    // You can also order or filter your data if necessary using _databaseReference.orderByChild('childName'), etc.
    return _databaseReference.onValue;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    _databaseReference =
        FirebaseDatabase.instance.ref(widget.coursename).child('SUBJECTS');
    return Scaffold(
      // appBar: Appbar(
      //   appbartitle: 'Subjects',
      //   ontap: () {},
      // ),
      appBar: AppBar(
        title: Text('Subjects'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => AddCourseContentAfterAddingCourse(
      //             coursename: 'Class 7',
      //           ),
      //         ));
      //   },
      //   child: Icon(Icons.add),
      // ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            width: width * 0.833,
            height: height * 0.04875,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
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
                  hintText: 'Search For The Subjects',
                  iconColor: Color(0xff7455F7),
                  border: InputBorder.none),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          StreamBuilder(
            stream: getChildrenStream(),
            builder:
                (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData ||
                  snapshot.data?.snapshot.value == null) {
                return Nodatafound();
              } else {
                //DataSnapshot dataValues = snapshot.data!.snapshot;
                //  Map<dynamic, dynamic> values = dataValues.value as Map<dynamic, dynamic>;
                //  List<ChildItem> items = values.entries.map((e) => ChildItem(e.key, e.value)).toList();
                return Expanded(
                  child: FirebaseAnimatedList(
                    query: _databaseReference,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      // Assuming your child nodes are maps with a 'name' field
                      final child = ChildItem.fromSnapshot(snapshot);
                      if (searchfiltercontroller.text.isEmpty) {
                        return Column(children: [
                          SubjectCardView(
                            title: child.key,
                            subtitle: widget.coursename,
                            imglink: widget.courseimglink,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LectureList(
                                      subject: child.key,
                                      coursename: widget.coursename,
                                      imglink: widget.courseimglink,
                                    ),
                                  ));
                            },
                          ),
                          SizedBox(
                            height: height * 0.01875,
                          )
                        ]);
                      } else if (child.key.toLowerCase().toString().contains(
                          searchfiltercontroller.text
                              .toLowerCase()
                              .toString())) {
                        return Column(children: [
                          SubjectCardView(
                            title: child.key,
                            subtitle: widget.coursename,
                            imglink: widget.courseimglink,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LectureList(
                                      subject: child.key,
                                      coursename: widget.coursename,
                                      imglink: widget.courseimglink,
                                    ),
                                  ));
                            },
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ]);
                      } else {
                        return Container();
                      }
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
// class ChildItem {
//   final String key;
//   final dynamic value;

//   ChildItem(this.key, this.value);

//   ChildItem.fromSnapshot(DataSnapshot snapshot)
//       : key = snapshot.key!,
//         value = snapshot.value;

//   // Add any other relevant methods and properties for your data model
// }

  
  
  