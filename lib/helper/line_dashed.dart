import 'package:flutter/material.dart';

enum LineOrientationType { horizontal, vertical }

class LineDashedPainter extends CustomPainter {
  final LineOrientationType orientationType;
  double maxDash;
  double dashWidth;
  double dashSpace;
  double storeWidth;

  LineDashedPainter({
    this.orientationType = LineOrientationType.horizontal,
    this.maxDash = 35,
    this.dashWidth = 5,
    this.dashSpace = 5,
    this.storeWidth = 1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..strokeWidth = storeWidth;
    double startX = 0;
    double startY = 0;
    while (maxDash >= 0) {
      if (LineOrientationType.horizontal == orientationType) {
        canvas.drawLine(
            Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      } else {
        canvas.drawLine(
            Offset(0, startY), Offset(0, startY + dashWidth), paint);
      }

      final space = (dashSpace + dashWidth);
      startX += space;
      startY += space;
      maxDash -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


class DotDivider extends StatelessWidget {
  final double width;
  final double height;
  final double gap;
  final Color color;
  final double lineHeight;

  const DotDivider(
      {this.height = 1.0,
        this.color = Colors.black,
        this.width = 2.0,
        this.gap = 2.0,
        this.lineHeight = 10.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / dashWidth).floor();
        return Container(
          height: (lineHeight * 2) + height,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: dashCount,
            itemBuilder: (BuildContext context, int index) => Center(
              child: Container(
                width: dashWidth,
                height: dashHeight,
                margin:
                EdgeInsets.symmetric(vertical: lineHeight, horizontal: gap),
                decoration: BoxDecoration(color: color),
              ),
            ),
          ),
        );
      },
    );
  }
}