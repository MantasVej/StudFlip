import '/backend/schema/structs/index.dart';
import '/components/circle_button_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_component_widget.dart' show CardComponentWidget;
import 'package:flutter/material.dart';

class CardComponentModel extends FlutterFlowModel<CardComponentWidget> {
  ///  Local state fields for this component.

  bool isEditMode = false;

  CardStruct? card;
  void updateCardStruct(Function(CardStruct) updateFn) =>
      updateFn(card ??= CardStruct());

  ///  State fields for stateful widgets in this component.

  // State field(s) for CardQuestionField widget.
  FocusNode? cardQuestionFieldFocusNode;
  TextEditingController? cardQuestionFieldController;
  String? Function(BuildContext, String?)? cardQuestionFieldControllerValidator;
  // State field(s) for CardAnswerField widget.
  FocusNode? cardAnswerFieldFocusNode;
  TextEditingController? cardAnswerFieldController;
  String? Function(BuildContext, String?)? cardAnswerFieldControllerValidator;
  // Model for EditButton.
  late CircleButtonComponentModel editButtonModel;
  // Model for UpdateButton.
  late CircleButtonComponentModel updateButtonModel;

  @override
  void initState(BuildContext context) {
    editButtonModel = createModel(context, () => CircleButtonComponentModel());
    updateButtonModel =
        createModel(context, () => CircleButtonComponentModel());
  }

  @override
  void dispose() {
    cardQuestionFieldFocusNode?.dispose();
    cardQuestionFieldController?.dispose();

    cardAnswerFieldFocusNode?.dispose();
    cardAnswerFieldController?.dispose();

    editButtonModel.dispose();
    updateButtonModel.dispose();
  }
}
