import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogView extends StatelessWidget {
  BlogView({Key key, this.titleHeader, this.items, this.onTapItem})
      : super(key: key);
  final String titleHeader;
  final List<BlogItemData> items;
  final GestureTapCallback onTapItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(

        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    titleHeader,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 3.7,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return BlogItemView(context, i);
                  },
                  itemCount: items.length,
                  padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
                ))
          ],
        ),
      ),
    );
  }

  Widget BlogItemView(BuildContext context, int i) {
    return FittedBox(
      child: Container(
          margin: EdgeInsets.only(right: i != items.length - 1 ? 16 : 0, top: 16),
          child: InkWell(
            onTap: onTapItem,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: (MediaQuery.of(context).size.height / 2.5) / 2.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(items[i].img), fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                      child: Text(
                        items[i].title,
                        style: Theme.of(context).textTheme.subhead,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),

                  )
                ],
              ),
            ),
          ),

      ),
    );
  }
}

class BlogItemData {
  String title;
  String img;

  BlogItemData({this.title, this.img});

  static List<BlogItemData> getExample() {
    return [
      BlogItemData(
          title:
          "Introducing Irish Cream Cold Brew",
          img:
          "https://firebasestorage.googleapis.com/v0/b/yogiutrra.appspot.com/o/ezgif.com-gif-maker.webp?alt=media&token=09c9b4aa-2c8d-46b8-8ea3-459cbd56a958"),
      BlogItemData(
          title: "Starbucks introduces first new beverages of 2020",
          img:
              "https://stories.starbucks.com/uploads/2020/01/SBX2020106-Winter-Beverages-Featured-Image-300x146.jpg"),
      BlogItemData(
          title:
              "Starbucks holiday beverages around the world",
          img:
              "https://stories.starbucks.com/uploads/2019/12/SBX20191216-HolidayBeveragesAroundTheWorld-Feature-300x146.jpg"),

    ];
  }static List<BlogItemData> getExampleSocial() {
    return [
      BlogItemData(
          title:
          "5 things to know about Starbucks new environmental sustainability commitment",
          img:
          "https://stories.starbucks.com/uploads/2020/01/SBX20200117-StarbucksSustainabilityTopFive-Feature-300x146.jpg"),
      BlogItemData(
          title: "Starbucks introduces first new beverages of 2020",
          img:
              "https://stories.starbucks.com/uploads/2020/01/SBX2020106-Winter-Beverages-Featured-Image-300x146.jpg"),
      BlogItemData(
          title:
              "Starbucks holiday beverages around the world",
          img:
              "https://stories.starbucks.com/uploads/2019/12/SBX20191216-HolidayBeveragesAroundTheWorld-Feature-300x146.jpg"),

    ];
  }
}
