import '/flutter_flow/flutter_flow_util.dart';
import 'connection_tests_list_widget.dart' show ConnectionTestsListWidget;
import 'package:flutter/material.dart';

class ConnectionTestsListModel
    extends FlutterFlowModel<ConnectionTestsListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
