import '/backend/schema/structs/index.dart';
import '/components/connect_answer_widget.dart';
import '/components/connect_question_widget.dart';
import '/components/results_connect_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'connection_test_model.dart';
export 'connection_test_model.dart';

class ConnectionTestWidget extends StatefulWidget {
  const ConnectionTestWidget({
    super.key,
    required this.test,
  });

  final CardsTestStruct? test;

  @override
  State<ConnectionTestWidget> createState() => _ConnectionTestWidgetState();
}

class _ConnectionTestWidgetState extends State<ConnectionTestWidget> {
  late ConnectionTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectionTestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          setState(() {
            _model.testquestions = functions
                .newCustomFunction(widget.test!.cards.toList())
                .toList()
                .cast<CardStruct>();
          });
        }),
        Future(() async {
          setState(() {
            _model.testanswers = functions
                .newCustomFunction(widget.test!.cards.toList())
                .toList()
                .cast<CardStruct>();
          });
        }),
      ]);
      _model.ques = functions
          .newCustomFunction2(_model.testanswers.toList())
          .toList()
          .cast<String>();
      while (_model.quiz.length < widget.test!.cards.length) {
        setState(() {
          _model.addToQuiz(0);
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFABF1EA),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).success,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 35.0,
            ),
            onPressed: () async {
              context.pushNamed('ConnectionTestsList');
            },
          ),
          title: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.test?.topic,
                'Card Test',
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 32.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Builder(
                        builder: (context) {
                          final questions = _model.testquestions.toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(questions.length,
                                (questionsIndex) {
                              final questionsItem = questions[questionsIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: ConnectQuestionWidget(
                                  key: Key(
                                      'Key66f_${questionsIndex}_of_${questions.length}'),
                                  question: questionsItem.question,
                                  index: questionsIndex,
                                ),
                              );
                            }),
                          );
                        },
                      ),
                      Builder(
                        builder: (context) {
                          final answers = _model.testanswers.toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(answers.length, (answersIndex) {
                              final answersItem = answers[answersIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: ConnectAnswerWidget(
                                  key: Key(
                                      'Keyp4n_${answersIndex}_of_${answers.length}'),
                                  answer: answersItem.answer,
                                  index: answersIndex,
                                  list: _model.ques,
                                  upadated: (number) async {
                                    setState(() {
                                      _model.updateQuizAtIndex(
                                        functions.newCustomFunction3(number!),
                                        (_) => _model
                                                    .testquestions[functions
                                                        .newCustomFunction3(
                                                            number)]
                                                    .answer ==
                                                answersItem.answer
                                            ? 1
                                            : 0,
                                      );
                                    });
                                                                    },
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 30.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.correct = await actions.newCustomAction2(
                              _model.quiz.toList(),
                            );
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ResultsConnectWidget(
                                      correct: _model.correct!,
                                      total: _model.quiz.length,
                                      restart: () async {},
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            setState(() {});
                          },
                          text: 'CHECK',
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 60.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).success,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Rubik',
                                  color: Colors.white,
                                  fontSize: 28.0,
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
