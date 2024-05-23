import '/flutter_flow/flutter_flow_util.dart';
import 'study_tests_list_widget.dart' show StudyTestsListWidget;
import 'package:flutter/material.dart';

class StudyTestsListModel extends FlutterFlowModel<StudyTestsListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
