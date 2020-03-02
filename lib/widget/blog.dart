import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starbuck_app/feature/detail_blog.dart';
import 'package:starbuck_app/helper/helper.dart';

class BlogView extends StatelessWidget {
  BlogView({Key key, this.titleHeader, this.items, this.onTapItem})
      : super(key: key);
  final String titleHeader;
  final List<BlogItemData> items;
  final GestureTapCallback onTapItem;

  @override
  Widget build(BuildContext context) {
    return Container(

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
                height: MediaQuery.of(context).size.width/1.8,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return BlogItemView(context, i);
                  },
                  itemCount: items.length,
                  padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
                ))
          ],
        ),

    );
  }

  Widget BlogItemView(BuildContext context, int i) {
    return Container(
      width: MediaQuery.of(context).size.width/1.8,
      margin: EdgeInsets.only(right: i != items.length - 1 ? 16 : 0, top: 16),
      child: OpenContainerWrapper(
        closeContainer: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,

          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Image.network(
                    items[i].img,
                    fit: BoxFit.cover,
                    height:  MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "${items[i].title}",
              style: Theme.of(context).textTheme.subhead,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
            ),
          ],
        ),
        openContainer: DetailBlogPage(
          title: items[i].title,
          imgUrl: items[i].img,
        ),
        transitionType: ContainerTransitionType.fade,
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
