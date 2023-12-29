
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kalyan_education_video_app/Auth/loginwithphoneno.dart';
import 'package:kalyan_education_video_app/Auth/roundbuttonnew.dart';
import 'package:kalyan_education_video_app/Auth/signupnew.dart';
import 'package:kalyan_education_video_app/Courses/Allcourses.dart';
import 'package:kalyan_education_video_app/Home/mainpage.dart';
import 'package:kalyan_education_video_app/Utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool _isPasswordVisible = false;
  bool loading = false;

  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    
    _auth // login succesful to then function mei chala jayega warna on error mei chala jayegaa
        .signInWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: passwordcontroller.text.toString())
        .then(
      (value) {
       setState(() {
      loading = true;
    });
        Utils().toastMessage('Login succesful');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllCoursesScreen(),
            ));
      },
    ).onError(
      (error, stackTrace) {
        loading = false;
        Utils().toastMessage(error.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.055, vertical: height * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              SizedBox(
                height: height * 0.0425,
              ),
              Text(
                'E-mail',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
              Form(
                  key: _formfield,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.04125,
                      ),
                      TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                borderSide: BorderSide(
                                    color: Color(0xFF7455F7), width: 3)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Color(0xFF7455F7), width: 3),
                            ),
                            //helperText: 'Enter your email',
                            prefixIcon: Icon(
                              Icons.alternate_email,
                              color: Color(0xFF7455F7),
                            ),
                            iconColor: Color(0xFF7455F7)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.04125,
                      ),
                      Text(
                        'Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04125,
                      ),
                      TextFormField(
                        controller: passwordcontroller,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color(0xFF7455F7), width: 3)),
                            prefixIcon: Icon(
                              Icons.lock_clock_outlined,
                              color: Color(0xFF7455F7),
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                icon: Icon(
                                  _isPasswordVisible
                                      ? (Icons.visibility)
                                      : Icons.visibility_off,
                                  color: _isPasswordVisible
                                      ? Color(
                                          0xFF7455F7) // Color when password is visible
                                      : Color(0xFF7455F7),
                                ))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              SizedBox(
                height: height * 0.05875,
              ),
              Roundbuttonnew(
                loading: loading,
                title: 'Log In',
                ontap: () {
                  if (_formfield.currentState!.validate()) {
                    login();
                  }
                },
              ),
              SizedBox(
                height: height * 0.02125,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpNew(),
                          ));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Color(0xFF7455F7)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height*0.0375,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
