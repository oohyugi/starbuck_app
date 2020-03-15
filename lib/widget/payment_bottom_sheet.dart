import 'package:flutter/material.dart';
import 'package:starbuck_app/helper/helper.dart';

import 'button.dart';

void showPaymentBottomSheet({BuildContext context, int totalPayment}) {
  bool isShowLoading = false;
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, state) {
          return Container(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: ClipPath(
                    clipper: BottomSheetClipper(),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Phone Number",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextField(
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintText: "Ex. 081243534534"),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "Total: Rp$totalPayment",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                              PrimaryFullWidthButton(
                                label: "Bayar",
                                onTap: () {
                                  dismissKeyboard(context);
                                  state(() {
                                    isShowLoading = !isShowLoading;
                                  });
                                },
                                isShowLoading: isShowLoading,
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (!isShowLoading) {
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                      width: 32,
                      height: 32,
                      margin: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(
                        Icons.clear,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          );
        });
      });
}

class BottomSheetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(center: Offset(32, 0.0), radius: 20.0));
//    path.addOval(Rect.fromCircle(
//        center: Offset(size.width, size.height / 2), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CheckoutData {
  int productId;
  int paymentType;
  int qty;
  double price;
  double totalPrice;
  double totalPayment;
}
