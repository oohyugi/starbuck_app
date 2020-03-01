import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridWithHeaderView extends StatelessWidget {
  GridWithHeaderView({Key key, this.titleHeader, this.items, this.onTapItem, this.subtitleHeader})
      : super(key: key);
  final String titleHeader;
  final String subtitleHeader;
  final List<ItemData> items;
  final GestureTapCallback onTapItem;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                titleHeader,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 16,),
              Text(
                titleHeader,
                style: Theme.of(context).textTheme.subhead,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                    child: GridView.builder(
                      itemBuilder: (context, i) {
                        return GridItemView(context, i);
                      },
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,

                      shrinkWrap: true, gridDelegate:
                    new SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        crossAxisCount: 2),
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: OutlineButton(
                  borderSide: BorderSide(color:Theme.of(context).primaryColor),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      "Show all",
                      style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),

      ),
    );
  }

  Widget GridItemView(BuildContext context, int i) {
    return Container(
      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/3.7,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: NetworkImage(items[i].img),fit: BoxFit.fitWidth)
                  )
                ),

              SizedBox(height: 16,),
              Expanded(
                child: Text(
                  items[i].title,
                  style: Theme.of(context).textTheme.subhead,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,

                ),
              )
            ],
          )
    );
  }
}

class ItemData {
  String title;
  String img;

  ItemData({this.title, this.img});

  static List<ItemData> getExample() {
    return [
      ItemData(
          title:
          "Sous Vide Egg Bites",
          img:
          "https://content-prod-live.cert.starbucks.com/binary/v2/asset/137-58150.png"),
       ItemData(
          title:
              "Coconutmilk Latte",
          img:
              "https://content-prod-live.cert.starbucks.com/binary/v2/asset/137-58125.png"),
      ItemData(
          title:
          "Fuel your day",
          img:
          "https://content-prod-live.cert.starbucks.com/binary/v2/asset/137-58506.png"),
      ItemData(
          title: "Almondmilk Honey Flat White",
          img:
          "https://content-prod-live.cert.starbucks.com/binary/v2/asset/137-58126.png"),

    ];
  }
}
