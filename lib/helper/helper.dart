import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class HexColor extends Color {
  static _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    this.transitionType,
    this.openContainer,
    this.closeContainer,
  });

  final ContainerTransitionType transitionType;
  final Widget openContainer;
  final Widget closeContainer;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return openContainer;
      },
      closedBuilder: (BuildContext context, VoidCallback _) {
        return closeContainer;
      },
    );
  }
}
