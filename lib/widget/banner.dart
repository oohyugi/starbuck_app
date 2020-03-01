import 'package:flutter/material.dart';
import 'package:starbuck_app/helper/helper.dart';

class BannerView extends StatefulWidget {
  BannerView({Key key, @required this.lists, this.onTapBanner})
      : super(key: key);

  final List<BannerItemData> lists;
  final GestureTapCallback onTapBanner;

  @override
  State<StatefulWidget> createState() {
    return _BannerViewState();
  }
}

class _BannerViewState extends State<BannerView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BannerItemData> list = widget.lists;
    GestureTapCallback onTap = widget.onTapBanner;
    return Padding(
      padding: const EdgeInsets.only(top: 16,bottom: 16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, i) {
            return BannerItemVIew(
              onTap: onTap,
              item: list[i],
              position: i,
              listSize: list.length,
            );
          },
          itemCount: list.length,
        ),
      ),
    );
  }
}

class BannerItemVIew extends StatelessWidget {
  const BannerItemVIew({
    Key key,
    @required this.onTap,
    @required this.item,
    this.position,
    this.listSize,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final BannerItemData item;
  final int position;

  final int listSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          margin: EdgeInsets.only(right: position != listSize - 1 ? 16 : 0),
          decoration: BoxDecoration(
              color: HexColor(item.backgroundColor),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: HexColor(item.textColor),
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        item.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: HexColor(item.textColor), fontSize: 12),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      OutlineButton(
                        color: HexColor(item.textColor),
                        borderSide: BorderSide(color: HexColor(item.textColor)),
                        onPressed: () {},
                        child: Text(
                          "Learn more",
                          style: TextStyle(color: HexColor(item.textColor)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Image.network(
                  item.image,
                  width: MediaQuery.of(context).size.width / 3.4,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BannerItemData {
  String image;
  String title;
  String description;
  String backgroundColor;
  String textColor;

  BannerItemData(
      {this.title,
      this.image,
      this.description,
      this.backgroundColor,
      this.textColor});

  static List<BannerItemData> getExample(){
    return [
      BannerItemData(
          title: "OH HELLO AGAIN",
          description:
          "Cozy is a flavor and that flavor is Smoked Butterscotch. Snuggle up with the perfect treat.",
          image: "https://content-prod-live.cert.starbucks.com/binary/v2/asset/137-58996.png",
          backgroundColor: "#DFECE5",
          textColor: "#006241"),
      BannerItemData(
          title: "SAY YES TO YOU",
          description:
          "Enjoy today and every day with our creamy non-dairy beverage options. Smooth, delicious and subtly sweet.",
          image: "https://content-prod-live.cert.starbucks.com/binary/v2/asset/137-58995.png",
          backgroundColor: "#D1E1EC",
          textColor: "#000000"),
      BannerItemData(
          title: "Enjoy more Rewards",
          description:
          "Earn Stars in and out of Starbucks® stores with the Starbucks® Rewards Visa® Card and the Starbucks® Rewards Visa® Prepaid Card.",
          image: "https://content-prod-live.cert.starbucks.com/binary/v2/asset/137-59045.png",
          backgroundColor: "#FFFFFF",
          textColor: "#000000"),
      BannerItemData(
          title: "All you, all right",
          description:
          "Cage-free egg options for any time of day. Start today with one of our breakfast choices.",
          image: "https://content-prod-live.cert.starbucks.com/binary/v2/asset/137-58756.png",
          backgroundColor: "#1E3932",
          textColor: "#FFFFFF"),
    ];
  }
}

