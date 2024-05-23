import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'study_test_component_widget.dart' show StudyTestComponentWidget;
import 'package:flutter/material.dart';

class StudyTestComponentModel
    extends FlutterFlowModel<StudyTestComponentWidget> {
  ///  Local state fields for this component.

  CardsTestStruct? cardsTest;
  void updateCardsTestStruct(Function(CardsTestStruct) updateFn) =>
      updateFn(cardsTest ??= CardsTestStruct());

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - Timer] action in IconButton widget.
  int? time;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
