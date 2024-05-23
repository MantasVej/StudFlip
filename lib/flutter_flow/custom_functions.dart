import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<CardStruct> newCustomFunction(List<CardStruct> questions) {
  questions.shuffle();
  return questions;
}

List<String> newCustomFunction2(List<CardStruct> cards) {
  List<String> result = [];
  for (int i = 0; i < cards.length; i++) {
    result.add(i.toString());
  }
  return result;
}

int newCustomFunction3(String number) {
  return int.parse(number);
}

int newCustomFunction4(
  int minutes,
  int seconds,
) {
  int milliseconds = (minutes * 60 + seconds) * 1000;
  return milliseconds;
}
