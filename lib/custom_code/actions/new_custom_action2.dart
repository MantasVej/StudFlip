// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> newCustomAction2(List<int> questions) async {
  int sum = 0;
  for (int i = 0; i < questions.length; i++) {
    sum += questions[i];
  }
  return sum;
}
