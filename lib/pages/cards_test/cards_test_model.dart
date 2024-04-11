import '/flutter_flow/flutter_flow_util.dart';
import 'cards_test_widget.dart' show CardsTestWidget;
import 'package:flutter/material.dart';

class CardsTestModel extends FlutterFlowModel<CardsTestWidget> {
  ///  Local state fields for this page.

  int? result;

  List<int> quiz = [];
  void addToQuiz(int item) => quiz.add(item);
  void removeFromQuiz(int item) => quiz.remove(item);
  void removeAtIndexFromQuiz(int index) => quiz.removeAt(index);
  void insertAtIndexInQuiz(int index, int item) => quiz.insert(index, item);
  void updateQuizAtIndex(int index, Function(int) updateFn) =>
      quiz[index] = updateFn(quiz[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Custom Action - newCustomAction2] action in CardsTestCard widget.
  int? correct;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
