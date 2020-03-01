import 'package:flutter/material.dart';
import 'package:starbuck_app/helper/helper.dart';
import 'package:starbuck_app/helper/line_dashed.dart';

import 'order_now.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(

        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text("Balance",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),), Text("Rp30.000",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16))],
                ),
                SizedBox(
                  height: 8,
                ),
                DotDivider(
                  color: Colors.black45,
                  width: 4,
                ),
                SizedBox(
                  height: 64,
                ),

                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Rewards",
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.card_giftcard,
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Gift Cards",
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.settings_overscan,
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Scan QR",
                          )
                        ],
                      )
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
