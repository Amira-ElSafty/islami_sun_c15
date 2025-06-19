import 'package:flutter/material.dart';
import 'package:islami_sun_c15/utils/app_styles.dart';

class SuraContentItem2 extends StatelessWidget {
  String suraContent;

  SuraContentItem2({super.key, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    return Text(
      suraContent,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: AppStyles.bold20Primary,
    );
  }
}
