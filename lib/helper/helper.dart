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

dismissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
}
double scaleSmallDevice(BuildContext context) {
  final size = MediaQuery.of(context).size;
  // For tiny devices.
  print(size);
  if (size.height < 600) {
    return 0.7;
  }
  // For normal devices.
  return 1.0;
}
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double _textScaleFactor;
  bool allowFontScaling =true;
  static double scaleText;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth -
        _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight -
        _safeAreaVertical) / 100;
    _textScaleFactor = _mediaQueryData.textScaleFactor;
//    scaleText = screenWidth*
  }

  num setSp(num fontSize, {bool allowFontScalingSelf}) =>
      allowFontScalingSelf == null
          ? (allowFontScaling
          ? (fontSize * scaleText)
          : ((fontSize * scaleText) / _textScaleFactor))
          : (allowFontScalingSelf
          ? (fontSize * scaleText)
          : ((fontSize * scaleText) / _textScaleFactor));
}