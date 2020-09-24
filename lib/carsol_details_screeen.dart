import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class CoursolDetails extends StatefulWidget {
  @override
  _CoursolDetailsState createState() => _CoursolDetailsState();
}

class _CoursolDetailsState extends State<CoursolDetails> {
  InterstitialAd myInterstitial;
  // ignore: must_call_super
  void initState() {
    MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['flutterio', 'beautiful apps'],
      contentUrl: 'https://flutter.io',
       // or MobileAdGender.female, MobileAdGender.unknown
      testDevices: <String>[], // Android emulators are considered test devices
    );

    // ignore: unused_local_variable
    InterstitialAd myInterstitial = InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
    return Scaffold();
  }
}