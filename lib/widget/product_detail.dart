import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatefulWidget {
  final String categoryName;
  final String productName;
  final String imgProduct;
  final int price;
  final Function(int totalPrice, int qty) onQtyChange;

  ProductDetailView(
      {Key key,
      this.categoryName,
      this.productName,
      this.imgProduct,
      this.onQtyChange,
      this.price})
      : super(key: key);

  @override
  _ProductDetailViewState createState() {
    return _ProductDetailViewState();
  }
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int _qty = 1;
  int _totalPrice = 0;
  int _price = 0;

  @override
  void initState() {
    super.initState();
    _price = widget.price;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: Colors.white,
      child: Container(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: widget.imgProduct != null
                        ? CachedNetworkImage(
                            imageUrl: widget.imgProduct,
                            placeholder: (context, url) => Container(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.productName,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w700),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "RP20.000",
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      "RP 18.000",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: jumlahPesanan(context),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row jumlahPesanan(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: qtyButton(context, Icons.add, () {
            setState(() {
              _qty++;
              _totalPrice = _price * _qty;
              widget.onQtyChange(_totalPrice, _qty);
            });
          }),
        ),
        SizedBox(
          width: 16,
        ),
        SizedBox(
          width: 24,
          child: Text(
            "$_qty",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Container(
          child: qtyButton(context, Icons.remove, () {
            if (_qty != 1) {
              _qty--;
              setState(() {
                _totalPrice = _price * _qty;
                widget.onQtyChange(_totalPrice, _qty);
              });
            }
          }),
        ),
      ],
    );
  }

  InkWell qtyButton(
      BuildContext context, IconData icon, GestureTapCallback onTapButton) {
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
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
