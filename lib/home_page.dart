import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  BannerAd? _bannerAd;
  bool _isLoaded = false;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-4615187191450423/7790396115'
      : 'ca-app-pub-3940256099942544/2435281174';


  /// Loads a banner ad.
  void loadAd() async {


    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.sizeOf(context).width.truncate());

    if(size != null){
      _bannerAd = BannerAd(
        adUnitId: adUnitId,
        request: const AdRequest(),
        size: size,
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            setState(() {
              _isLoaded = true;
            });
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (ad, err) {
            debugPrint('BannerAd failed to load: $err');
            // Dispose the ad here to free resources.
            ad.dispose();
          },
        ),
      )..load();
    }

  }


  InterstitialAd? _interstitialAd;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitIdIntentitial = Platform.isAndroid
      ? 'ca-app-pub-4615187191450423/8366516151'
      : 'ca-app-pub-4615187191450423/8366516151';


  /// Loads an interstitial ad.
  void loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: adUnitIdIntentitial,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadAd();
  }

  @override
  void initState() {
    // TODO: implement initState
   loadInterstitialAd();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdMob Facebook'),
      ),
      body: Column(
        children: [
          if(_isLoaded)
            Container(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // loadAd();
                  loadInterstitialAd();
                  _interstitialAd?.show();
                },
                child: Text('Load Ad'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
