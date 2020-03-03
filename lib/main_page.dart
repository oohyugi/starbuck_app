import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:starbuck_app/feature/home.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  Position _lastKnownPosition;
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _initLastKnownLocation();
    _initCurrentLocation();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
//    if(state == AppLifecycleState.paused){
//      getCurrentLocation();
//      print("resume state");
//    }
    super.didChangeAppLifecycleState(state);
  }

  Position currentPosition;

  Future<void> _initLastKnownLocation() async {
    Position position;
    try {
      final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
      position = await geolocator.getLastKnownPosition(
          desiredAccuracy: LocationAccuracy.best);
    } on PlatformException {
      position = null;
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _lastKnownPosition = position;
      print(
          "lastknown latitude =${position.latitude} lastknown longitude = ${position.longitude}");
    });
  }

  _initCurrentLocation() {
    Geolocator()
      ..forceAndroidLocationManager
      ..getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      ).then((position) {
        if (mounted) {
          setState(() => _currentPosition = position);
        }
        print(
            "current latitude =${position.latitude} currentlongitude = ${position.longitude}");
      }).catchError((e) {
        //
      });
  }

  Future checkGps(Geolocator geolocator) async {
    await geolocator.isLocationServiceEnabled().then((serviceValue) {
      if (serviceValue) {
        geolocator
            .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
            .then((position) {
          print(
              "latitude =${position.latitude} longitude = ${position.longitude}");
        }).catchError((e) {
          print("get location $e");
        });
      } else {
        gotoSettingGps();
      }
    }).catchError((e) {
      print("Location service $e");
    });
  }

  gotoSettingGps() {
    AppSettings.openLocationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
