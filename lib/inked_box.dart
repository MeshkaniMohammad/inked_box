library inked_box;

import 'package:flutter/material.dart';

class InkedChildWidget extends InkResponse {
  final InkedBox inkBox;

  InkedChildWidget({
    @required this.inkBox,
    Key key,
    Widget child,
    GestureTapCallback onTap,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureTapDownCallback onTapDown,
    GestureTapCancelCallback onTapCancel,
    ValueChanged<bool> onHighlightChanged,
    BoxShape highlightShape = BoxShape.rectangle,
    Color highlightColor,
    Color splashColor,
    InteractiveInkFeatureFactory splashFactory,
    double radius,
    BorderRadius borderRadius,
    ShapeBorder customBorder,
    bool enableFeedback = true,
    bool excludeFromSemantics = false,
  }) : super(
    containedInkWell: true,
    highlightShape: highlightShape,
    customBorder: customBorder,
    child: child,
    onTap: onTap,
    onTapDown: onTapDown,
    onTapCancel: onTapCancel,
    onDoubleTap: onDoubleTap,
    onLongPress: onLongPress,
    onHighlightChanged: onHighlightChanged,
    radius: radius,
    borderRadius: borderRadius,
    highlightColor: highlightColor,
    splashColor: splashColor,
    splashFactory: splashFactory,
    enableFeedback: enableFeedback,
    excludeFromSemantics: excludeFromSemantics,
  );

  @override
  RectCallback getRectCallback(RenderBox referenceBox) {
    return () => inkBox.rect(ancestor: referenceBox);
  }
}

class InkedBox extends StatelessWidget {
  final GestureTapCallback onTap;

  InkedBox({this.child, this.onTap});

  final Widget child;
  BuildContext context;

  Rect rect({RenderObject ancestor}) =>
    (context.findRenderObject() as RenderBox)
      .localToGlobal(Offset.zero, ancestor: ancestor) &
    context.size;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return child;
  }
}