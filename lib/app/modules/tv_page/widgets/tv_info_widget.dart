import 'package:flutter/material.dart';
import 'package:yshare/domain/entities/tv_details.dart';

class TvInfoWidget extends StatelessWidget {
  final TvDetails tv;

  const TvInfoWidget({Key key, @required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter();
  }
}
