import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({Key key, this.label, this.onTap}) : super(key: key);

  final String label;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    RaisedButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(),
      color: Theme.of(context).primaryColor,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class PrimaryFullWidthButton extends StatelessWidget {
  PrimaryFullWidthButton(
      {Key key, this.label, this.onTap, this.isShowLoading = false})
      : super(key: key);

  final String label;
  final GestureTapCallback onTap;
  final bool isShowLoading;

  @override
  Widget build(BuildContext context) {
    print(isShowLoading);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(),
        color: Theme.of(context).primaryColor,
        height: 46,
        child: _setUpButtonChild(),
      ),
    );
  }

  Widget _setUpButtonChild() {
    if (isShowLoading) {
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        label,
        style: TextStyle(color: Colors.white),
      );
    }
  }
}
