import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HorizontalListWheel extends StatelessWidget {
  final List<Widget> children;
  final Axis direction;
  final ScrollController controller;
  final double itemExtent;
  final ListWheelChildDelegate childDelegate;
  final double offAxisFraction;
  final double perspective;
  final double diameterRatio;

  const HorizontalListWheel({
    Key key,
    this.children,
    this.direction = Axis.horizontal,
    this.controller,
    this.offAxisFraction = 0,
    this.diameterRatio = RenderListWheelViewport.defaultDiameterRatio,
    this.perspective = RenderListWheelViewport.defaultPerspective,
    @required this.itemExtent,
    @required this.childDelegate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: direction == Axis.horizontal ? 3 : 0,
      child: ListWheelScrollView.useDelegate(
        itemExtent: itemExtent,
        physics: FixedExtentScrollPhysics(),
        controller: controller,
        offAxisFraction: offAxisFraction,
        perspective: perspective,
        diameterRatio: diameterRatio,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return RotatedBox(
              quarterTurns: direction == Axis.horizontal ? 1 : 0,
              child: childDelegate.build(context, index),
            );
          },
        ),
      ),
    );
  }
}
