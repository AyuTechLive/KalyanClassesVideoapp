import 'package:flutter/material.dart';

class Tagcardview extends StatelessWidget {
  final String title;
  const Tagcardview({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Container(
      width: width * 0.20,
      height: height * 0.02625,
      decoration: ShapeDecoration(
        color: Color(0xFF7455F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w800,
            height: 0,
          ),
        ),
      ),
    );
  }
}
