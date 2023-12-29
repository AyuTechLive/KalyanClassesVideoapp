import 'package:flutter/material.dart';

class SearchBarCustom extends StatefulWidget {
  final TextEditingController searcheditingcontroller1;
  const SearchBarCustom({super.key, required this.searcheditingcontroller1});

  @override
  State<SearchBarCustom> createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  final searchfiltercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Container(
      width: width * 0.833,
      height: height * 0.04875,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
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
      child: TextFormField(
        textAlign: TextAlign.justify,
        controller: widget.searcheditingcontroller1,
        cursorColor: Color(0xff7455F7),
        decoration: InputDecoration(
            icon: Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.03, height * 0.001, 0, height * 0.001),
                child: Icon(Icons.search)),
            hintText: 'Search For The Course',
            iconColor: Color(0xff7455F7),
            border: InputBorder.none),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}
