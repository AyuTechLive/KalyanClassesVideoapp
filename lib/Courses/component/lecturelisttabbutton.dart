import 'package:flutter/material.dart';

class LectureListTabButton extends StatelessWidget {
  final String title;
  final Color color;
  
  const LectureListTabButton(
      {super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;

    return Container(
      height: height * 0.05,
      width: width*0.33,
     
      decoration: ShapeDecoration(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
    );
  }
}
