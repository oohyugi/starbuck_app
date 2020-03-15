import 'package:flutter/material.dart';
import 'package:starbuck_app/widget/additional_variant.dart';
import 'package:starbuck_app/widget/bottom_sheet.dart';
import 'package:starbuck_app/widget/product_detail.dart';
import 'package:starbuck_app/widget/recap_payment.dart';
import 'package:starbuck_app/widget/select_payment.dart';

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
  int price = 18000;
  int _totalPrice = 18000;
  int _discontPrice = 2000;
  String _selectedVariant = "Cold, Regular";
  PaymentData _paymentSelected =
      PaymentData("OVO", "Pay with OVO App", "assets/images/ic_ovo.png", true);

  int _selectedPaymentPos = 0;
  double keyboardSize = 0;

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
    print(MediaQuery.of(context).viewInsets.bottom);
    setState(() {
      keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    });
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Order Detail',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          centerTitle: false,
          iconTheme: IconThemeData(color: Colors.black87)),
      body: LayoutBuilder(

          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            ProductDetailView(
                              productName: widget.productName,
                              imgProduct: widget.imgProduct,
                              price: price,
                              onQtyChange: (totalPrice, qty) {
                                setState(() {
                                  _totalPrice = totalPrice;
                                });
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              color: Colors.white,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Select Variant",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          showCustomBottomSheet(
                                              context: context,
                                              height:
                                              MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height / 2,
                                              child: AdditionalVariantView(
                                                onSelectVariant: (val) {
                                                  setState(() {
                                                    String list = val.join(
                                                        ", ");

                                                    _selectedVariant = list;
                                                  });
                                                },
                                              ));
                                        },
                                        child: RawChip(
                                          label: Text(
                                            _selectedVariant,
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                          backgroundColor: Theme
                                              .of(context)
                                              .accentColor,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16),
                              child: adsFreeProduct(context),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: InkWell(
                                  onTap: () {
                                    showCustomBottomSheet(
                                        context: context,
                                        height: 300,
                                        child: SelectPayment(
                                          listPayment: {
                                            0: PaymentData(
                                                "OVO", "Pay with OVO App",
                                                "assets/images/ic_ovo.png",
                                                false),
                                            1: PaymentData(
                                                "Gopay", "Pay with Gopay App",
                                                "assets/images/ic_gopay.png",
                                                false),
                                          },
                                          selectedPos: _selectedPaymentPos,
                                          onPaymentSelected: (data, pos) {
                                            print(data.name);
                                            setState(() {
                                              _paymentSelected = data;
                                              _selectedPaymentPos = pos;
                                            });
                                          },
                                        ));
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Text("Pay With",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w700)),
                                      ItemPaymentView(item: _paymentSelected)
                                    ],
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
                      RecapPaymentView(
                          totalPrice: _totalPrice, discontPrice: _discontPrice),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }

  Container adsFreeProduct(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.green[100]),
      child: ListTile(
        title: Text(
          "Get Product for free",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        trailing: MaterialButton(
          onPressed: () {},
          child: Text(
            "Survey",
            style: TextStyle(color: Colors.white),
          ),
          height: 40,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
