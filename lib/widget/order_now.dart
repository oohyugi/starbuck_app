import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:starbuck_app/feature/menu/menu_page.dart';

class OrderNowView extends StatelessWidget {
  const OrderNowView({
    Key key,
    @required this.topPos,
    @required this.marginOrdernow,
    @required this.borderRadiusSizeOrderNow,
    @required this.backroundOrderNow,
    @required this.textColorOrderNow, this.outletLocation, this.distance,
  }) : super(key: key);

  final double topPos;
  final double marginOrdernow;
  final double borderRadiusSizeOrderNow;
  final Color backroundOrderNow;
  final Color textColorOrderNow;
  final String outletLocation;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPos > 24 ? topPos : 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
          duration: Duration(
            milliseconds: 300,
          ),
          margin: EdgeInsets.symmetric(horizontal: marginOrdernow),
          child: OpenContainer(
              closedColor: backroundOrderNow,
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusSizeOrderNow),
              ),
              closedElevation: backroundOrderNow == Colors.white ? 4 : 0,
              transitionType: ContainerTransitionType.fade,
              openBuilder: (context, openContainer) {
                return MenuPage();
              },
              closedBuilder: (context, closeContainer) {
                return Container(
                  height: 56,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.shop,
                              color: textColorOrderNow,
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Pesan Sekarang",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: textColorOrderNow),
                                ),
                                Text("Pilih outlet Terdekat",
                                    style: TextStyle(
                                        color: textColorOrderNow, fontSize: 12))
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.place,
                              color: textColorOrderNow,
                            ),
                            Text(
                              distance,
                              style: TextStyle(
                                  color: textColorOrderNow, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}

