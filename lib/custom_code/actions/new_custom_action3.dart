// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future newCustomAction3(List<CardStruct> questions) async {
  // shuffle the provided list
  List<CardStruct> shuffledQuestions = List.from(questions);
  shuffledQuestions.shuffle();
  return shuffledQuestions;
}
