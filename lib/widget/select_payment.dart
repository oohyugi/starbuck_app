import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectPayment extends StatefulWidget {
  SelectPayment(
      {Key key, this.listPayment, this.onPaymentSelected, this.selectedPos = 0})
      : super(key: key);
  final Map<int, PaymentData> listPayment;
  final Function(PaymentData, int) onPaymentSelected;
  final int selectedPos;

  @override
  _SelectPaymentState createState() {
    return _SelectPaymentState();
  }
}

class _SelectPaymentState extends State<SelectPayment> {
  int _selectedPos = 0;
  Map<int, PaymentData> listPayment = Map();

  @override
  void initState() {
    super.initState();
    listPayment = widget.listPayment;
    _selectedPos = widget.selectedPos;
    listPayment[_selectedPos].isSelected = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onSelectedPayment(int i) {
    setState(() {
      listPayment.forEach((key, val) {
        if (i != key) {
          val.isSelected = false;
        } else {
          val.isSelected = true;
          widget.onPaymentSelected(val, i);
          Navigator.pop(context);
        }
      });
//      listPayment[i].isSelected = !listPayment[i].isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Select Payment",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 16,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 100),
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, i) {
                    return Divider(
                      color: Colors.black12,
                    );
                  },
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: listPayment.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        _onSelectedPayment(i);
                      },
                      child: ItemPaymentView(item: listPayment[i]),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemPaymentView extends StatelessWidget {
  const ItemPaymentView({
    Key key,
    @required this.item,
  }) : super(key: key);

  final PaymentData item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.asset(item.imgAsset),
        backgroundColor: Colors.blue,
      ),
      title: Text(item.name),
      subtitle: Text(item.description),
      trailing: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black12,
            ),
            color: item.isSelected ? Theme.of(context).primaryColor : null),
        child: item.isSelected
            ? Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              )
            : null,
      ),
    );
  }
}

class PaymentData<T> {
  String name;
  String description;
  String imgAsset;
  bool isSelected = false;

  PaymentData(this.name, this.description, this.imgAsset, this.isSelected);
}
