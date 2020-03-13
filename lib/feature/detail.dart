import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  final String categoryName;
  final String productName;
  final String imgProduct;

  OrderDetailPage(
      {Key key, this.categoryName, this.productName, this.imgProduct})
      : super(key: key);

  @override
  _OrderDetailPageState createState() {
    return _OrderDetailPageState();
  }
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  int qty = 1;
  int price = 18000;
  int totalPrice = 0;
  int totalPayment = 0;
  int discontPrice = 2000;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details page')),
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 4)
                          ],
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: widget.imgProduct != null
                                        ? CachedNetworkImage(
                                      imageUrl: widget.imgProduct,
                                      placeholder: (context, url) =>
                                          Container(
                                            color: Colors.black26,
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                    )
                                        : Container(
                                        color: Colors.black26,
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Text(
                                          widget.productName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 21),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "RP20.000",
                                          style: TextStyle(
                                              decoration:
                                              TextDecoration.lineThrough),
                                        ),
                                        Text(
                                          "RP 18.000",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 19,
                                              color:
                                              Theme
                                                  .of(context)
                                                  .primaryColor),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: <Widget>[
                                                Container(
                                                  child: qtyButton(
                                                      context, Icons.add, () {
                                                    setState(() {
                                                      qty++;
                                                      totalPrice = price * qty;
                                                    });
                                                  }),
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                                SizedBox(
                                                  width: 24,
                                                  child: Text(
                                                    "$qty",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      fontSize: 17,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                                Container(
                                                  child: qtyButton(
                                                      context,
                                                      Icons.remove, () {
                                                    setState(() {
                                                      qty--;
                                                      totalPrice = price * qty;
                                                    });
                                                  }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green[100]),
                          child: ListTile(
                            title: Text(
                              "Get Product for free",
                              style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .primaryColor),
                            ),
                            trailing: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "Survey",
                                style: TextStyle(color: Colors.white),
                              ),
                              height: 40,
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.white,
                  elevation: 2,
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "Payment Detail",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.black12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Price"),
                              Text(
                                "RP $totalPrice",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Discount"),
                              Text(
                                "-$discontPrice",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.black12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Total Payment",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Rp ${totalPrice - discontPrice}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SafeArea(
                            child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                child: MaterialButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(),
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  height: 42,
                                  child: Text(
                                    "Beli",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell qtyButton(BuildContext context, IconData icon,
      GestureTapCallback onTapButton) {
    return InkWell(
      onTap: onTapButton,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)]),
        child: Icon(
          icon,
          color: Theme
              .of(context)
              .primaryColor,
        ),
      ),
    );
  }
}
