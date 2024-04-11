import '/backend/schema/structs/index.dart';
import '/components/circle_button_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'card_component_model.dart';
export 'card_component_model.dart';

class CardComponentWidget extends StatefulWidget {
  const CardComponentWidget({
    super.key,
    required this.card,
    this.onDelete,
    this.onUpdate,
    required this.index,
  });

  final CardStruct? card;
  final Future Function()? onDelete;
  final Future Function()? onUpdate;
  final int? index;

  @override
  State<CardComponentWidget> createState() => _CardComponentWidgetState();
}

class _CardComponentWidgetState extends State<CardComponentWidget> {
  late CardComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.card = widget.card;
      });
    });

    _model.cardQuestionFieldController ??=
        TextEditingController(text: _model.card?.question);
    _model.cardQuestionFieldFocusNode ??= FocusNode();

    _model.cardAnswerFieldController ??=
        TextEditingController(text: _model.card?.answer);
    _model.cardAnswerFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const AlignmentDirectional(1.0, -1.0),
      children: [
        Container(
          width: 240.0,
          height: 240.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondary,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(16.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).secondary,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    if (_model.isEditMode == false) {
                                      return Text(
                                        widget.card!.question,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              letterSpacing: 0.0,
                                              lineHeight: 1.5,
                                            ),
                                      );
                                    } else {
                                      return Container(
                                        width: 200.0,
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .cardQuestionFieldController,
                                            focusNode: _model
                                                .cardQuestionFieldFocusNode,
                                            onFieldSubmitted: (_) async {
                                              setState(() {
                                                _model.updateCardStruct(
                                                  (e) => e
                                                    ..question = _model
                                                        .cardQuestionFieldController
                                                        .text,
                                                );
                                              });
                                              setState(() {
                                                FFAppState().updateCardsAtIndex(
                                                  widget.index!,
                                                  (_) => _model.card!,
                                                );
                                              });
                                              setState(() {
                                                _model.isEditMode =
                                                    !_model.isEditMode;
                                              });
                                              await widget.onUpdate?.call();
                                            },
                                            autofocus: true,
                                            textInputAction:
                                                TextInputAction.done,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelText: 'Card Text',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Question',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                            maxLines: null,
                                            validator: _model
                                                .cardQuestionFieldControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if (_model.isEditMode == false) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Text(
                                widget.card!.answer,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            );
                          } else {
                            return Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.cardAnswerFieldController,
                                  focusNode: _model.cardAnswerFieldFocusNode,
                                  onFieldSubmitted: (_) async {
                                    setState(() {
                                      _model.updateCardStruct(
                                        (e) => e
                                          ..answer = _model
                                              .cardAnswerFieldController.text,
                                      );
                                    });
                                    setState(() {
                                      FFAppState().updateCardsAtIndex(
                                        widget.index!,
                                        (_) => _model.card!,
                                      );
                                    });
                                    setState(() {
                                      _model.isEditMode = !_model.isEditMode;
                                    });
                                    await widget.onUpdate?.call();
                                  },
                                  autofocus: true,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Answer',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                  maxLines: null,
                                  validator: _model
                                      .cardAnswerFieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                if (_model.isEditMode == false) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.cardQuestionFieldController
                                            ?.text = widget.card!.question;
                                      });
                                      setState(() {
                                        _model.isEditMode = !_model.isEditMode;
                                      });
                                    },
                                    child: wrapWithModel(
                                      model: _model.editButtonModel,
                                      updateCallback: () => setState(() {}),
                                      child: const CircleButtonComponentWidget(
                                        icon: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.updateCardStruct(
                                          (e) => e
                                            ..question = _model
                                                .cardQuestionFieldController
                                                .text
                                            ..answer = _model
                                                .cardAnswerFieldController.text,
                                        );
                                      });
                                      setState(() {
                                        FFAppState().updateCardsAtIndex(
                                          widget.index!,
                                          (_) => _model.card!,
                                        );
                                      });
                                      setState(() {
                                        _model.isEditMode = !_model.isEditMode;
                                      });
                                      await widget.onUpdate?.call();
                                    },
                                    child: wrapWithModel(
                                      model: _model.updateButtonModel,
                                      updateCallback: () => setState(() {}),
                                      child: CircleButtonComponentWidget(
                                        icon: Icon(
                                          Icons.check,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        opacity: 1.0,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]
                .addToStart(const SizedBox(height: 16.0))
                .addToEnd(const SizedBox(height: 8.0)),
          ),
        ),
        Container(
          decoration: const BoxDecoration(),
          child: Opacity(
            opacity: 0.5,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  setState(() {
                    FFAppState().removeAtIndexFromCards(widget.index!);
                  });
                  await widget.onDelete?.call();
                },
                child: Icon(
                  Icons.delete,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
