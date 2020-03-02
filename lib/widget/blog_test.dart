import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../feature/detail_blog.dart';
import '../helper/helper.dart';

class BlogTestView extends StatelessWidget {
  BlogTestView({Key key, this.titleHeader, this.items, this.onTapItem})
      : super(key: key);
  final String titleHeader;
  final List<BlogItemDataTest> items;
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
                height: MediaQuery.of(context).size.width/1.8,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return BlogTestItem(context, i);
                  },
                  itemCount: items.length,
                  padding: EdgeInsets.only(left: 16,  right: 16),
                ),
              )
            ],
          ),
        ));
  }

  Widget BlogTestItem(BuildContext context, int i) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.6,
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
                          image: NetworkImage(items[i].img),
                          fit: BoxFit.cover)),
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

class BlogItemDataTest {
  String title;
  String img;

  BlogItemDataTest({this.title, this.img});

  static List<BlogItemDataTest> getExample() {
    return [
      BlogItemDataTest(
          title: "Introducing Irish Cream Cold Brew",
          img:
              "https://stories.starbucks.com/uploads/2019/11/SBX20191112-Starbucks-Chicago-Roastery-Featured-Image-300x146.jpg"),
      BlogItemDataTest(
          title: "Starbucks introduces first new beverages of 2020",
          img:
              "https://stories.starbucks.com/uploads/2020/01/SBX2020106-Winter-Beverages-Featured-Image-300x146.jpg"),
      BlogItemDataTest(
          title: "Starbucks holiday beverages around the world",
          img:
              "https://stories.starbucks.com/uploads/2019/12/SBX20191216-HolidayBeveragesAroundTheWorld-Feature-300x146.jpg"),
    ];
  }
}
