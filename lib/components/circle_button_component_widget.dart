import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'circle_button_component_model.dart';
export 'circle_button_component_model.dart';

class CircleButtonComponentWidget extends StatefulWidget {
  const CircleButtonComponentWidget({
    super.key,
    required this.icon,
    Color? color,
    double? opacity,
  })  : color = color ?? Colors.white,
        opacity = opacity ?? 0.2;

  final Widget? icon;
  final Color color;
  final double opacity;

  @override
  State<CircleButtonComponentWidget> createState() =>
      _CircleButtonComponentWidgetState();
}

class _CircleButtonComponentWidgetState
    extends State<CircleButtonComponentWidget> with TickerProviderStateMixin {
  late CircleButtonComponentModel _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.1, 1.1),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CircleButtonComponentModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Opacity(
            opacity: widget.opacity,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            width: 40.0,
            height: 40.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: widget.icon!,
          ),
        ],
      ),
    ).animateOnActionTrigger(
      animationsMap['containerOnActionTriggerAnimation']!,
    );
  }
}
