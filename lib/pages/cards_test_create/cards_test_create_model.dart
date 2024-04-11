import '/flutter_flow/flutter_flow_util.dart';
import 'cards_test_create_widget.dart' show CardsTestCreateWidget;
import 'package:flutter/material.dart';

class CardsTestCreateModel extends FlutterFlowModel<CardsTestCreateWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ScrollableColumn widget.
  ScrollController? scrollableColumn;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    scrollableColumn = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    scrollableColumn?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
