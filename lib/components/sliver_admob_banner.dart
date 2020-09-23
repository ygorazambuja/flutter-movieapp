import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class SliverAdmobBanner extends StatelessWidget {
  final String adUnitId;

  const SliverAdmobBanner({Key key, this.adUnitId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AdmobBanner(
          adUnitId: adUnitId,
          adSize: AdmobBannerSize.BANNER,
          listener: (AdmobAdEvent event, Map<String, dynamic> args) {},
        ),
      ),
    );
  }
}
