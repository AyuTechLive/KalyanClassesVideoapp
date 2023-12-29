import 'package:flutter/material.dart';

class HomeScreenCard extends StatelessWidget {
  final String title;
  final String img;
  final VoidCallback ontap;
  const HomeScreenCard({super.key, required this.title, required this.img, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width * 0.40,
        height: height * 0.23,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            // side: BorderSide(width: 1, color: Color(0xFF7455F7)),
            borderRadius: BorderRadius.circular(20),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/$img.png',
                  height: height * 0.1875,
                  width: width * 0.4,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
