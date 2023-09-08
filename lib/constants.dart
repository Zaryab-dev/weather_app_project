import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color textColor = Colors.white;

String getTimeFromTimestamp(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = DateFormat('h:mm a');
  return formatter.format(date);
}