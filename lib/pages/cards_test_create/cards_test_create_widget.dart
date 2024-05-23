import '/backend/schema/structs/index.dart';
import '/components/card_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'cards_test_create_model.dart';
export 'cards_test_create_model.dart';

class CardsTestCreateWidget extends StatefulWidget {
  const CardsTestCreateWidget({
    super.key,
    this.cardstest,
    bool? update,
    this.index,
  }) : update = update ?? false;

  final CardsTestStruct? cardstest;
  final bool update;
  final int? index;

  @override
  State<CardsTestCreateWidget> createState() => _CardsTestCreateWidgetState();
}

class _CardsTestCreateWidgetState extends State<CardsTestCreateWidget> {
  late CardsTestCreateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardsTestCreateModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.update == true) {
        setState(() {
          _model.textController?.text = widget.cardstest!.topic;
        });
        setState(() {
          FFAppState().cards =
              widget.cardstest!.cards.toList().cast<CardStruct>();
        });
      } else {
        return;
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF0C8077),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  alignLabelWithHint: true,
                  hintText: 'Cards Topic...',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Rubik',
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                    ),
                maxLength: 20,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                buildCounter: (context,
                        {required currentLength,
                        required isFocused,
                        maxLength}) =>
                    null,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          toolbarHeight: 85.0,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    controller: _model.scrollableColumn,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            width: double.infinity,
                            height: 80.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderRadius: 40.0,
                                  borderWidth: 1.0,
                                  buttonSize: 72.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  icon: Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 50.0,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      FFAppState().addToCards(CardStruct(
                                        question: ' ',
                                        answer: ' ',
                                      ));
                                    });
                                    unawaited(
                                      () async {
                                        await _model.scrollableColumn
                                            ?.animateTo(
                                          0,
                                          duration: const Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );
                                      }(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (FFAppState().cards.isNotEmpty) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final card = FFAppState().cards.toList();
                                      return Wrap(
                                        spacing: 50.0,
                                        runSpacing: 10.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection: VerticalDirection.up,
                                        clipBehavior: Clip.none,
                                        children: List.generate(card.length,
                                            (cardIndex) {
                                          final cardItem = card[cardIndex];
                                          return CardComponentWidget(
                                            key: Key(
                                                'Key5ta_${cardIndex}_of_${card.length}'),
                                            index: cardIndex,
                                            card: cardItem,
                                            onDelete: () async {
                                              setState(() {});
                                            },
                                            onUpdate: () async {
                                              setState(() {});
                                            },
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ],
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                height: 500.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit_square,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 72.0,
                                    ),
                                    Text(
                                      'Create your cards by hitting the + icon',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ].addToStart(const SizedBox(height: 10.0)),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 5.0,
                thickness: 3.0,
                color: Color(0xFF0C8077),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (widget.update == true) {
                      setState(() {
                        FFAppState().updateCardsTestsAtIndex(
                          widget.index!,
                          (e) => e
                            ..topic = _model.textController.text
                            ..cards = FFAppState().cards.toList(),
                        );
                      });
                    } else {
                      FFAppState().addToCardsTests(CardsTestStruct(
                        topic: _model.textController.text,
                        cards: FFAppState().cards,
                      ));
                    }

                    FFAppState().cards = [];

                    context.goNamed(
                      'CardTestsList',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 400),
                        ),
                      },
                    );
                  },
                  text: 'DONE',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF0C8077),
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Rubik',
                              letterSpacing: 0.0,
                            ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
