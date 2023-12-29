import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalyan_education_video_app/Courses/Allcourses.dart';
import 'package:kalyan_education_video_app/Courses/component/tagcardview.dart';
import 'package:kalyan_education_video_app/Home/mainpage.dart';
import 'package:kalyan_education_video_app/Utils/utils.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CourseDetails extends StatefulWidget {
  final String coursename;
  final String courseprice;
  final String courseImage;
  final String coursediscription;

  const CourseDetails(
      {super.key,
      required this.coursename,
      required this.courseprice,
      required this.courseImage,
      required this.coursediscription});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('Users').snapshots();
  final _razorpay = Razorpay();
  CollectionReference ref = FirebaseFirestore.instance.collection('Users');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Utils().toastMessage(response.paymentId.toString());

    // ref.doc(auth.currentUser!.email.toString()).update({'UID': "1234567"});
    searchAndCreateCourse1(widget.coursename);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear(); // Removes all listeners
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
    final String coursepricefinal = widget.courseprice;
    return Scaffold(
      // appBar: Appbar(
      //   appbartitle: 'Purchase',
      //   ontap: () {},
      // ),
      appBar: AppBar(
        title: Text('Purchase'),
        backgroundColor: Color(0xff7455F7),
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.1),
                    child: Text(
                      widget.coursename,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: height * 0.03,
                ),

                Container(
                    height: height * 0.20,
                    width: width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        widget.courseImage,
                        scale: 1.0,
                        fit: BoxFit.fill,
                      ),
                    )),

                //  Image.network(widget.courseImage),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Spacer(),
                  Tagcardview(
                    title: 'Videos',
                  ),
                  Spacer(),
                  Tagcardview(
                    title: 'Test',
                  ),
                  Spacer(),
                  Tagcardview(
                    title: 'Pdfs',
                  ),
                  Spacer(),
                ]),
                SizedBox(
                  height: height * 0.063,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    Text(
                      'Course contents :',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Image.asset('assets/icons/addicon.png'),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: width * 0.8,
                          child: Text(
                            widget.coursediscription,
                            style: TextStyle(
                              color: Color(0xFF3F434A),
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                            softWrap: true,
                            // overflow: TextOverflow.ellipsis,
                            maxLines: 100,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                // Text(widget.coursename),
                //  Text(widget.courseprice),
                //  Text(widget.courseImage),
                //  Text(widget.coursediscription),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
        // RoundButton(
        //       title: 'Buy Now',
        //       onTap: () {
        //         var options = {
        //           'key': 'rzp_test_tyxaS4GuEkyx6N',
        //           'amount': int.parse(widget.courseprice) *
        //               100, //in the smallest currency sub-unit.
        //           'name': widget.coursename, // Generate order_id using Orders API
        //           'description': widget.coursediscription,
        //           'timeout': 120, // in seconds
        //           'prefill': {
        //             'contact': '9123456789',
        //             'email': 'gaurav.kumar@example.com'
        //           }
        //         };
        //         _razorpay.open(options);
        //       },
        //     )
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, height * 0.02),
          child: Container(
            width: width * 0.833,
            height: height * 0.075,
            decoration: ShapeDecoration(
              color: Color(0xFF7455F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.02, 0, width * 0.03, 0),
                  child: Text(
                    'Price - ₹ $coursepricefinal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //  var options = {
                    //       'key': 'rzp_test_tyxaS4GuEkyx6N',
                    //       'amount': int.parse(coursepricefinal) *
                    //           100, //in the smallest currency sub-unit.
                    //       'name': widget.coursename, // Generate order_id using Orders API
                    //       'description': widget.coursediscription,
                    //       'timeout': 240, // in seconds
                    //       'prefill': {
                    //         'contact': '9123456789',
                    //         'email': 'gaurav.kumar@example.com'
                    //       }
                    //     };
                    //     _razorpay.open(options);
                    searchAndCreateCourse1(widget.coursename);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: width * 0.4388,
                    height: height * 0.07,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
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
                    child: Text(
                      'BUY NOW',
                      style: TextStyle(
                        color: Color(0xFF3F434A),
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  Future<void> searchAndCreateCourse1(String coursename) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String usersCollectionPath = 'Users'; // The collection name
    String userEmailsDocumentId = auth.currentUser!.email ??
        auth.currentUser!.phoneNumber!;  // The document name
    String courseFieldKey =
        coursename; // The field key for the course data within the emails document

    // Reference to the emails document in the users collection
    DocumentReference emailsDocumentRef =
        firestore.collection(usersCollectionPath).doc(userEmailsDocumentId);

    try {
      DocumentSnapshot emailsSnapshot = await emailsDocumentRef.get();

      if (emailsSnapshot.exists) {
        Map<String, dynamic> emailsData =
            emailsSnapshot.data() as Map<String, dynamic>;

        if (emailsData.containsKey(courseFieldKey) &&
            emailsData[courseFieldKey] is List) {
          List<dynamic> courseList = emailsData[courseFieldKey];
          if (courseList[0] == 0) {
            await emailsDocumentRef.update({
              courseFieldKey: [2],
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AllCoursesScreen(),
              ),
            );
          }
        }
      }
    } catch (e) {
      // Handle any errors
      print('Error occurred: $e');
      // You might want to handle this error case or log it accordingly
      // For instance, showing an error dialog or navigating back
    }
  }
}
