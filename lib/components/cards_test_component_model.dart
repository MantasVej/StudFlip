import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cards_test_component_widget.dart' show CardsTestComponentWidget;
import 'package:flutter/material.dart';

class CardsTestComponentModel
    extends FlutterFlowModel<CardsTestComponentWidget> {
  ///  Local state fields for this component.

  CardsTestStruct? cardsTest;
  void updateCardsTestStruct(Function(CardsTestStruct) updateFn) =>
      updateFn(cardsTest ??= CardsTestStruct());

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
