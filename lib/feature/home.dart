import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:starbuck_app/helper/helper.dart';
import 'package:starbuck_app/widget/banner.dart';
import 'package:starbuck_app/widget/blog.dart';
import 'package:starbuck_app/widget/dashboard.dart';
import 'package:starbuck_app/widget/grid.dart';
import 'package:starbuck_app/widget/order_now.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController _scrollController;
  double topPos = 88;
  double appbarHeight = 56;
  Animation<double> appbarAnimation;
  AnimationController appbarController;
  Animation<double> orderAnimation;
  AnimationController orderController;
  var opacityOrdernowPinned = 0.0;
  double borderRadiusSizeOrderNow = 8;
  double marginOrdernow = 32;
  Color backroundOrderNow = HexColor("#006241");
  Color textColorOrderNow = Colors.white;

  onScrollItem() {}

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(onScrollItem);
    initAnimationAppbar();

    initAnimationOrderNow();
  }

  void initAnimationAppbar() {
    appbarController = AnimationController(
        value: 56, duration: const Duration(milliseconds: 300), vsync: this);
    appbarAnimation = Tween<double>(begin: 0, end: 56).animate(appbarController)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

  void initAnimationOrderNow() {
    orderController = AnimationController(
        value: 88, duration: const Duration(milliseconds: 300), vsync: this);
    orderAnimation = Tween<double>(begin: 88, end: 0).animate(orderController)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "STARBUCKS",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
          ),
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(appbarAnimation.value),
      ),
      body: Stack(
        children: <Widget>[
          NotificationListener<ScrollUpdateNotification>(
              onNotification: (value) {
                setState(() {
                  setAnimationAppbar();

                  setAnimationOrderNow(value);
                  print(_scrollController.offset);
                });
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: <Widget>[
                    DashboardView(),
                    BannerView(lists: BannerItemData.getExample()),
                    GridWithHeaderView(
                      titleHeader: "CELEBRATE THOSE EVERYDAY LITTLE MOMENTS.",
                      subtitleHeader: "",
                      items: ItemData.getExample(),
                    ),
                    BlogView(
                      titleHeader: "Starbucks Stories",
                      items: BlogItemData.getExample(),
                    ),
                    BlogView(
                      titleHeader: "Social Impact",
                      items: BlogItemData.getExampleSocial(),
                    )
                  ],
                ),
              )),
          OrderNowView(
            topPos: topPos,
            marginOrdernow: marginOrdernow,
            borderRadiusSizeOrderNow: borderRadiusSizeOrderNow,
            backroundOrderNow: backroundOrderNow,
            textColorOrderNow: textColorOrderNow,
          )
        ],
      ),
    );
  }

  void setAnimationAppbar() {
    if (_scrollController.offset !=
        _scrollController.position.maxScrollExtent) {
      if ((_scrollController.offset < 56) && (appbarAnimation.isDismissed)) {
        appbarController.forward();
      } else if ((_scrollController.offset > 56) &&
          (appbarController.isCompleted)) {
        appbarController.reverse();
      }
    }
  }

  void setAnimationOrderNow(ScrollUpdateNotification value) {
    topPos = topPos - value.scrollDelta;
    //                  marginOrdernow =topPos-value.scrollDelta;

    if (_scrollController.offset <= 64) {
      marginOrdernow = 32;
      borderRadiusSizeOrderNow = 8;
      backroundOrderNow = HexColor("#006241");
      textColorOrderNow = Colors.white;
    } else {
      marginOrdernow = 0;
      borderRadiusSizeOrderNow = 0;
      backroundOrderNow = Colors.white;
      textColorOrderNow = HexColor("#006241");

      //                   borderRadiusSizeOrderNow =8;
    }
  }
}
