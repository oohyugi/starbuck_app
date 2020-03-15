import 'package:flutter/material.dart';
import 'package:starbuck_app/widget/single_select_chip.dart';

class AdditionalVariantView extends StatefulWidget {
  final Function(List<String>) onSelectVariant;

  AdditionalVariantView({Key key, this.onSelectVariant}) : super(key: key);

  @override
  _AdditionalVariantViewState createState() {
    return _AdditionalVariantViewState();
  }
}

class _AdditionalVariantViewState extends State<AdditionalVariantView> {
  List<String> selectedVariant = List();
  String size = "Regular";
  String availablein = "Cold";
  String topping;

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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Available in",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SingleSelectChip(
                  [
                    "Cold",
                    "Hot",
                  ],
                  autoSelectFirstItem: true,
                  onSelectionChanged: (val) {
                    setState(() {
                      availablein = val;
                    });
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Size",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SingleSelectChip(["Regular", "Large"],
                    autoSelectFirstItem: true, onSelectionChanged: (val) {
                  setState(() {
                    size = val;
                  });
                }),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Toppings",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SingleSelectChip(
                  ["Bubble", "Oreo", "Espresso"],
                  onSelectionChanged: (val) {
                    setState(() {
                      topping = val;
                    });
                  },
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          SafeArea(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        selectedVariant.add(availablein);
                        selectedVariant.add(size);
                        if (topping != null) {
                          selectedVariant.add(topping);
                        }
                      });
                      widget.onSelectVariant(selectedVariant);
                    },
                    shape: RoundedRectangleBorder(),
                    color: Theme.of(context).primaryColor,
                    height: 42,
                    child: Text(
                      "Select",
                      style: TextStyle(color: Colors.white),
                    ),
                  )))
        ],
      ),
    );
  }
}
