
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/services.dart';
import 'package:kalyan_education_video_app/Activities/pdfopeningscreen.dart';
import 'package:kalyan_education_video_app/Activities/videoplayer.dart';
import 'package:kalyan_education_video_app/Courses/component/lecturecardview.dart';
import 'package:kalyan_education_video_app/Courses/component/notescardview.dart';
import 'package:kalyan_education_video_app/Home/components/nodatafound.dart';

class ChildItem {
  final String key;
  final dynamic value;

  ChildItem(this.key, this.value);

  ChildItem.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key!,
        value = snapshot.value;

  // Add any other relevant methods and properties for your data model
}

class LectureList extends StatefulWidget {
  final String subject;
  final String coursename;
  final String imglink;
  late DatabaseReference _databaseReference;
  LectureList(
      {Key? key,
      required this.subject,
      required this.coursename,
      required this.imglink})
      : super(key: key) {
    _databaseReference = FirebaseDatabase.instance
        .ref(coursename)
        .child('SUBJECTS')
        .child(subject)
        .child('Videos');
    // Initialize _databaseReference in the constructor
  }

  @override
  State<LectureList> createState() => _LectureListState();
}

class _LectureListState extends State<LectureList>
    with SingleTickerProviderStateMixin {
  late DatabaseReference _databaseReference;
  late TabController _tabController;
  final searchfiltercontroller = TextEditingController();
  final textcontroller = TextEditingController();
  int count = 0;
  Key _listKey = UniqueKey();
  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance
        .ref(widget.coursename)
        .child('SUBJECTS')
        .child(widget.subject)
        .child('Videos');

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.index == 1) {
      // Change child reference to 'PDF'
      // Update the FirebaseAnimatedList by setting a new query with the updated _databaseReference
      // setState(() {
      //    _databaseReference = FirebaseDatabase.instance
      //     .ref(widget.coursename)
      //     .child('SUBJECTS')
      //     .child(widget.subject)
      //     .child('Pdfs');
      // });
      print('first tab clciked');
    }
  }

  // .child('Maths')
  Stream<DatabaseEvent> getChildrenStream() {
    // Use the local _databaseReference instead of widget._databaseReference
    return _databaseReference.onValue;
  }

  //LectureList({super.key, required this.subject});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: DefaultTabController(
          length: 3,
          child: AppBar(
            title: Text(
              'All Contents',
              style: TextStyle(color: Color(0xFF7455F7)),
            ),
            iconTheme: IconThemeData(color: Color(0xFF7455F7)),
            backgroundColor: Colors.white,
            bottom: TabBar(
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              indicatorColor: Color(0xFF7455F7),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Color.fromARGB(255, 96, 70, 211),
              onTap: (value) {
                print(value);
                setState(() {
                  if (value == 0) {
                    _databaseReference = FirebaseDatabase.instance
                        .ref(widget.coursename)
                        .child('SUBJECTS')
                        .child(widget.subject)
                        .child('Videos');
                    count = 1;
                  } else if (value == 1) {
                    _databaseReference = FirebaseDatabase.instance
                        .ref(widget.coursename)
                        .child('SUBJECTS')
                        .child(widget.subject)
                        .child('Pdfs');
                    count = 2;
                  } else if (value == 2) {
                    _databaseReference = FirebaseDatabase.instance
                        .ref(widget.coursename)
                        .child('SUBJECTS')
                        .child(widget.subject)
                        .child('Test Series');
                    count = 3;
                  }
                  // Update the key to force rebuild the list
                  _listKey = UniqueKey();
                });
              },
              tabs: [
                Tab(text: 'Lectures'), // Tab 1
                Tab(text: 'Notes'), // Tab 2
                Tab(text: 'Test'), // Tab 3
              ],
            ),
          ),
        ),
      ),
      // appBar: Appbar(
      //   appbartitle: subject,
      //   ontap: () {},
      // ),
      // appBar: AppBar(
      //   title: Text(subject),
      //   backgroundColor: Color(0xff7455F7),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),

      body: Column(
        children: [
          SizedBox(
            height: height * 0.02,
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
              }
              else {
                return Expanded(
                  child: FirebaseAnimatedList(
                    key: _listKey,
                    query: _databaseReference,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      // Assuming your child nodes are maps with a 'name' field
                      final child = ChildItem.fromSnapshot(snapshot);
                      if (count == 1) {
                        return Column(children: [
                          LectureCardView(
                            title: child.value['Title'].toString(),
                            subtitle: child.value['Subtitle'].toString(),
                            imglink:
                                widget.imglink,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LectureVideoPlayer(
                                        videoURL: child.value['Video Link']
                                            .toString(),
                                        videoTitle:
                                            child.value['Title'].toString(),
                                        videoSubtitle:
                                            child.value['Subtitle'].toString()),
                                  ));
                            },
                          ),
                          SizedBox(
                          height: height * 0.01875,
                          ),
                        ]);
                      } else if (count == 2) {
                        return Column(children: [
                          NotesCardView(
                            title: child.value['Title'].toString(),
                            subtitle: child.value['Subtitle'].toString(),
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PdfViwer(
                                            pdfUrl: child.value['Pdf Link']
                                                .toString(),
                                            title:
                                                child.value['Title'].toString(),
                                          )));
                            },
                          ),
                          SizedBox(
                            height: height * 0.01875,
                          )
                        ]);
                      } else if (count == 3) {
                        return Column(children: [
                          LectureCardView(
                            title: child.value['Title'].toString(),
                            subtitle: child.value['Subtitle'].toString(),
                            imglink:
                                widget.imglink,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LectureVideoPlayer(
                                        videoURL: child.value['Video Link']
                                            .toString(),
                                        videoTitle:
                                            child.value['Title'].toString(),
                                        videoSubtitle:
                                            child.value['Subtitle'].toString()),
                                  ));
                            },
                          ),
                          SizedBox(
                            height: height * 0.01875,
                          )
                        ]);
                      } else {
                        return Column(children: [
                          LectureCardView(
                            title: child.value['Title'].toString(),
                            subtitle: child.value['Subtitle'].toString(),
                            imglink:
                                widget.imglink,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LectureVideoPlayer(
                                        videoURL: child.value['Video Link']
                                            .toString(),
                                        videoTitle:
                                            child.value['Title'].toString(),
                                        videoSubtitle:
                                            child.value['Subtitle'].toString()),
                                  ));
                            },
                          ),
                          SizedBox(
                            height: height * 0.01875,
                          )
                        ]);
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
