import 'package:flutter/material.dart';
import 'package:starbuck_app/helper/helper.dart';
import 'package:starbuck_app/widget/button.dart';
import 'package:starbuck_app/widget/payment_bottom_sheet.dart';

class RecapPaymentView extends StatefulWidget {
  RecapPaymentView({
    Key key,
    @required this.totalPrice,
    @required this.discontPrice,
  }) : super(key: key);

  final int totalPrice;
  final int discontPrice;

  @override
  _RecapPaymentViewState createState() {
    return _RecapPaymentViewState();
  }
}

class _RecapPaymentViewState extends State<RecapPaymentView> {
  bool isShowLoading = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onTapBeli() {
    dismissKeyboard(context);
    setState(() {
      isShowLoading = !isShowLoading;
    });
  }

  _onTapBayar() {
//    showCustomBottomSheet(
//        context: context,
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.start,
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 16),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Text(
//                    "Phone Number",
//                    style: TextStyle(
//                        fontSize: 18.0,
//                        fontWeight: FontWeight.w700),
//                  ),
//                  TextField(
//                    autofocus: true,
//                    keyboardType: TextInputType.number,
//                    decoration: InputDecoration(
//                        hintText: "Ex. 081243534534"),
//                  ),
//                  SizedBox(
//                    height: 24,
//                  ),
//                  Container(
//                    width: MediaQuery.of(context).size.width,
//                    child: Text(
//                      "Total: Rp ${widget.totalPrice - widget.discontPrice}",
//                      style: TextStyle(fontWeight: FontWeight.w700),
//                      textAlign: TextAlign.end,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 8,
//                  ),
//                ],
//              ),
//            ),
//            PrimaryFullWidthButton(
//              label: "Bayar",
//              onTap: _onTapBeli,
//              isShowLoading: isShowLoading,
//            )
//          ],
//        ));
    showPaymentBottomSheet(
        context: context,
        totalPayment: widget.totalPrice - widget.discontPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Payment Detail",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
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
                    "RP ${widget.totalPrice}",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Discount"),
                  Text(
                    "-${widget.discontPrice}",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
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
                    "Rp ${widget.totalPrice - widget.discontPrice}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            PrimaryFullWidthButton(
              label: "Beli",
              onTap: _onTapBayar,
            )
          ],
        ),
      ),
    );
  }
}
