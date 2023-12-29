import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String appbartitle;
  final VoidCallback ontap;
  const Appbar({super.key, required this.appbartitle, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;

    return Container(
      decoration: BoxDecoration(color: Color(0xff7455F7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width * 0.05,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
              child: InkWell(
                onTap: ontap,
                child: Image.asset(
                  'assets/icons/backbutton.png',
                  height: height * 0.0475,
                  width: width * 0.105,
                ),
              )),
          SizedBox(
            width: width * 0.1,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
            child: Text(
              appbartitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize

  Size get preferredSize => Size.fromHeight(60);
}
