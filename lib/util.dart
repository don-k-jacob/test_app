import 'dart:ffi';

import 'package:flutter/material.dart';

Widget verticalspacer(double hight) {
  return SizedBox(
    height: hight,
  );
}

Widget horizontalspacer(double width) {
  return SizedBox(
    height: width,
  );
}

List<String> month = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

List<String> weekDays=['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
