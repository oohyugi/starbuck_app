import 'package:flutter/material.dart';

void showCustomBottomSheet(
    {BuildContext context, double height, Widget child}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16),
                child: ClipPath(
                  clipper: BottomSheetClipper(),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery
                              .of(context)
                              .viewInsets
                              .bottom),
                      child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 32),
                            child: child,
                          )),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: 32,
                    height: 32,
                    margin: EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.clear,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        );
      });
}

class BottomSheetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(center: Offset(32, 0.0), radius: 20.0));
//    path.addOval(Rect.fromCircle(
//        center: Offset(size.width, size.height / 2), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
