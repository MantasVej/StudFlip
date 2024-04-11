import '/flutter_flow/flutter_flow_util.dart';
import 'card_tests_list_widget.dart' show CardTestsListWidget;
import 'package:flutter/material.dart';

class CardTestsListModel extends FlutterFlowModel<CardTestsListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
