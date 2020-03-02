import 'package:flutter/material.dart';
import 'package:starbuck_app/helper/helper.dart';
import 'package:starbuck_app/helper/screen_utils.dart';

class TestResponsive extends StatelessWidget {
  TestResponsive({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    SizeConfig().init(context);
    ScreenUtil.init(context, width: 360, height: 640, allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Colors.green,
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setHeight(100),
              child: Text("converter 100*100"),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              color: Colors.red,
              width: 100,
              height: 100,
              child: Text("normal 100*100"),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child:  Container(

                    width: MediaQuery.of(context).size.width,
                    child: Column(

                      children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            "TItle",
                            style: Theme.of(context).textTheme.title,
                          ),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                        Container(
                          height: 260,
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Center(
                                          child: Image.network(
                                            "https://stories.starbucks.com/uploads/2019/11/SBX20191112-Starbucks-Chicago-Roastery-Featured-Image-300x146.jpg",
                                            fit: BoxFit.cover,
                                            height: 260,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "Normal Starbucks introduces first new beverages of 2020",
                                      style: Theme.of(context).textTheme.subhead,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "TItle",
                          style: Theme.of(context).textTheme.title,
                        ),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                  Container(
                      height: ScreenUtil().setWidth(260),
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Center(
                                      child: Image.network(
                                        "https://stories.starbucks.com/uploads/2019/11/SBX20191112-Starbucks-Chicago-Roastery-Featured-Image-300x146.jpg",
                                        fit: BoxFit.cover,
                                        height: ScreenUtil().setWidth(260),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Convert Starbucks introduces first new beverages of 2020",
                                  style: TextStyle(
                                      fontSize: ScreenUtil()
                                          .setSp(16, allowFontScalingSelf: true)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),


                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
