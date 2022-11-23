// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseObjectivesList<T> extends StatelessWidget {
  const CourseObjectivesList({
    Key? key,
    required this.paragraphT,
  }) : super(key: key);

  final String paragraphT;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          '\u2022',
          textScaleFactor: 1.1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(width: 5),
        Expanded(
            child: Text(
          paragraphT,
          textScaleFactor: 1.1,
          style: TextStyle(
            color: Colors.white,
          ),
        ))
      ],
    );
  }
}
