import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'connection_test_widget.dart' show ConnectionTestWidget;
import 'package:flutter/material.dart';

class ConnectionTestModel extends FlutterFlowModel<ConnectionTestWidget> {
  ///  Local state fields for this page.

  int? result;

  List<int> quiz = [];
  void addToQuiz(int item) => quiz.add(item);
  void removeFromQuiz(int item) => quiz.remove(item);
  void removeAtIndexFromQuiz(int index) => quiz.removeAt(index);
  void insertAtIndexInQuiz(int index, int item) => quiz.insert(index, item);
  void updateQuizAtIndex(int index, Function(int) updateFn) =>
      quiz[index] = updateFn(quiz[index]);

  List<CardStruct> testquestions = [];
  void addToTestquestions(CardStruct item) => testquestions.add(item);
  void removeFromTestquestions(CardStruct item) => testquestions.remove(item);
  void removeAtIndexFromTestquestions(int index) =>
      testquestions.removeAt(index);
  void insertAtIndexInTestquestions(int index, CardStruct item) =>
      testquestions.insert(index, item);
  void updateTestquestionsAtIndex(int index, Function(CardStruct) updateFn) =>
      testquestions[index] = updateFn(testquestions[index]);

  List<CardStruct> testanswers = [];
  void addToTestanswers(CardStruct item) => testanswers.add(item);
  void removeFromTestanswers(CardStruct item) => testanswers.remove(item);
  void removeAtIndexFromTestanswers(int index) => testanswers.removeAt(index);
  void insertAtIndexInTestanswers(int index, CardStruct item) =>
      testanswers.insert(index, item);
  void updateTestanswersAtIndex(int index, Function(CardStruct) updateFn) =>
      testanswers[index] = updateFn(testanswers[index]);

  List<String> ques = [];
  void addToQues(String item) => ques.add(item);
  void removeFromQues(String item) => ques.remove(item);
  void removeAtIndexFromQues(int index) => ques.removeAt(index);
  void insertAtIndexInQues(int index, String item) => ques.insert(index, item);
  void updateQuesAtIndex(int index, Function(String) updateFn) =>
      ques[index] = updateFn(ques[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - newCustomAction2] action in Button widget.
  int? correct;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
