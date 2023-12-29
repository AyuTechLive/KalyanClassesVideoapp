import 'package:flutter/material.dart';

class ProfileCardDetails extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  const ProfileCardDetails({super.key, required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;

    return Padding(
      padding: EdgeInsets.only(left: width*0.04),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/$icon.png',
            color: Colors.grey,
            scale: 1.8,
          ),
          SizedBox(
            width: width * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color.fromARGB(255, 95, 94, 94),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ])
                ],
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 1,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
